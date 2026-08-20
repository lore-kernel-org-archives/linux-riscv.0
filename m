Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7BDC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nfEK1Vm5Gl/2sdoWX9LRMPWQXoKyCDhX/A+EZOrymk=; b=1cuNMk87dKHcyr
	gJiaegSI0WVQIfwFtN+rWWslnrV/cfy0VVV7WMoNc7JYg6vjuu1nR5P6IVINjPCvx2Os2SOvU7piu
	/rPHVRue8+76OsWT0a/G6VeAzc8QgHtYsX8c4UcUpnQR7/zwwShJlVnSoYl1rQSdumKseNzErbEJs
	p4rUrgLp/VM60qli3b28hJet79PWoorQ5+6in6xcd8jZe8ncZaX5UCBb1YrFXzLXJQ3/X6a+lYn2u
	9grpDeCc7+U6uJjNxhzPlUZbEez9X/TOYKtO3XPf6YcI1ssYc5QSgcG77avECGGO5Hj1S2y2S19i6
	nfzOBucYg4lIRZ89kJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1rj-0000000BXq8-15m6;
	Thu, 20 Aug 2026 12:27:27 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1re-0000000BXjw-32To
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 12:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787228832; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=2xVsDYOUg7+UocR1AiMbVhWi0R/f7vIyB3hX5jYrL2A=;
	b=bY+3jNbdf8coxPUCprzH3OTqANjdzW88kBLwtkPp/H20F0GVebTiOCDU0JUlyXcmLZsSsrdroIM43JgWjLgupGfV/CKRsuLDfwmFyB494vnY8z73dJlLiieroxpqbaNd/Aw22z71PxuEsKDqo64hJOzmX2UL/nkJGgmAe+tDfBc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X9JQc.V_1787228827;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9JQc.V_1787228827 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Aug 2026 20:27:11 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptrace: reject CFI regset access when extensions are absent
Date: Thu, 20 Aug 2026 20:26:59 +0800
Message-ID: <reply-guo-ren-cfi-ptrace-20260820@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTQ-_kSrtV_rpoMK2pKPM3q-CmgDwyX111XvM9oJ=oyDxg@mail.gmail.com>
References: <20260820063233.2567-1-cp0613@linux.alibaba.com> <CAJF2gTQ-_kSrtV_rpoMK2pKPM3q-CmgDwyX111XvM9oJ=oyDxg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052723_540944_0872BDC0 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgR3VvIFJlbiwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCk9uIDIwMjYvOC8yMCAxOTo0NSwg
R3VvIFJlbiB3cm90ZToKPiBPbiBUaHUsIEF1ZyAyMCwgMjAyNiBhdCAyOjMy4oCvUE0gQ2hlbiBQ
ZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4+ICsgICAgICAgaWYgKCFpc191
c2VyX2xwYWRfZW5hYmxlZCgpICYmICFpc191c2VyX3Noc3RrX2VuYWJsZWQoKSkKPiBEbyB5b3Ug
d2FudDoKPgo+IC8qIElmIHNoYWRvdyBzdGFjayBpcyBub3Qgc3VwcG9ydGVkIG9yIG5vdCBlbmFi
bGVkLCBub3RoaW5nIHRvIC4uLiAqLwo+IGlmICghaXNfdXNlcl9zaHN0a19lbmFibGVkKCkgfHwg
IWlzX3Noc3RrX2VuYWJsZWQodHNrKSkKClRoZXJlIGFyZSB0d28gc2VwYXJhdGUgcG9pbnRzIGhl
cmUsIGxldCBtZSBjbGFyaWZ5IGJvdGguCgpGaXJzdCwgb24gIiYmIiB2cyAifHwiIGJldHdlZW4g
dGhlIHR3byBmZWF0dXJlczogdGhlIGNvbWJpbmVkIGNoZWNrIGlzCmludGVudGlvbmFsLiBaaWNm
aWxwIGFuZCBaaWNmaXNzIGFyZSBpbmRlcGVuZGVudCBleHRlbnNpb25zIGFuZCB0aGUKa2VybmVs
IHRyZWF0cyB0aGVtIGFzIHN1Y2ggZXZlcnl3aGVyZSAoc2VwYXJhdGUgaHdwcm9iZSBrZXlzLCBz
ZXBhcmF0ZQpwcmN0bHMsIHNlcGFyYXRlIHJpc2N2X25vdXNlcmNmaSBzd2l0Y2hlcykuIFJlamVj
dGluZyB0aGUgcmVnc2V0IGFzCnNvb24gYXMgZWl0aGVyIG9uZSBpcyBtaXNzaW5nIHdvdWxkIGFs
c28gdGFrZSBhd2F5IHRoZSB1c2VmdWwgcGFydDogb24KYSBzeXN0ZW0gd2l0aCBvbmx5IHNoYWRv
dyBzdGFjaywgc2hzdGtfcHRyIGlzIGV4YWN0bHkgd2hhdCBhIGRlYnVnZ2VyCm5lZWRzIGZvciBz
aGFkb3cgc3RhY2sgdW53aW5kaW5nLCBhbmQgc3ltbWV0cmljYWxseSBmb3IgbGFuZGluZyBwYWRz
LgpXaXRoICImJiIsIHRoZSByZWdzZXQgc3RheXMgYXZhaWxhYmxlIHdoZW4gYXQgbGVhc3Qgb25l
IGZlYXR1cmUgaXMKcHJlc2VudCwgYW5kIHRoZSBtaXNzaW5nIGZlYXR1cmUncyBzZWN0aW9uIHJl
YWRzIGFzIGFsbC16ZXJvLCB3aGljaCBpcwphY2N1cmF0ZTogaXRzIHBlci10YXNrIGVuYWJsZSBm
bGFncyBjYW4gb25seSBiZSBzZXQgd2hlbiB0aGUgZmVhdHVyZQppcyBhdmFpbGFibGUsIHNpbmNl
IHRoZSBwcmN0bCBwYXRocyBhcmUgZ2F0ZWQgYnkKaXNfdXNlcl9scGFkX2VuYWJsZWQoKS9pc191
c2VyX3Noc3RrX2VuYWJsZWQoKSBpbmRpdmlkdWFsbHkuIFRoZSBzYW1lCmFwcGxpZXMgdG8gcmlz
Y3ZfY2ZpX3NldCgpOiBhICJ8fCIgd291bGQgd3JvbmdseSBibG9jayBsZWdpdGltYXRlCnNoc3Rr
X3B0ciB1cGRhdGVzIG9uIHNoYWRvdy1zdGFjay1vbmx5IHN5c3RlbXMuCgpTZWNvbmQsIG9uIHRo
ZSBwZXItdGFzayBjaGVjayAoaXNfc2hzdGtfZW5hYmxlZCh0YXJnZXQpIGFuZCBmcmllbmRzKToK
SSB3b3VsZCBwcmVmZXIgbm90IHRvIHJlamVjdCB0aGUgYWNjZXNzIHdoZW4gQ0ZJIGlzIHNpbXBs
eSBub3QgZW5hYmxlZApvbiB0aGUgdHJhY2VkIHRhc2suIFRoZSBhbGwtemVybyBzdGF0ZSBpcyBh
IG1lYW5pbmdmdWwgYW5zd2VyIC0tIGl0CnRlbGxzIHRoZSBkZWJ1Z2dlciB0aGF0IENGSSBpcyBu
b3QgZW5hYmxlZCBmb3IgdGhpcyB0YXNrLiBUaGlzIG1hdGNoZXMKdGhlIGFybTY0IEdDUyByZWdz
ZXQsIHdoaWNoIG9ubHkgY2hlY2tzIHN5c3RlbSBzdXBwb3J0IGluIGdjc19nZXQoKQphbmQgcmV0
dXJucyB0aGUgdGFzaydzIChwb3NzaWJseSB6ZXJvKSBzdGF0ZSB1bmNvbmRpdGlvbmFsbHkuCgpC
ZXN0IHJlZ2FyZHMsClBlaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
