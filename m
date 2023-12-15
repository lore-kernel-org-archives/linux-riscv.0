Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D96AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 06:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EEnk8hSde5fQb/tLfZ3LkU9TWbRJd4Duo6Fz7dRmyo=; b=crDdUh3W0qCwb9
	Q1+voVSI1n+o9dF6DTPrDUoKmZup5/anBJVmM3XR/FiHFZUWl3/89oi0CI5piMlu9i3kWZC8MZOG0
	fAjrnJRgDOpzSliUVVskV8+Cc1Kp6Q3SkwkAoW3oISYuywk6NkdOdCMrMvcieNtk22zaLYEa6kzE1
	BB1/0haSp/GCAxb6Qki/X33F9L3JLm9mlow5OfwMxnakt5rNVsd8wYabt85MGs5zlM8Gh0IRo3WFd
	FHicuFQJIafpXNFmbD/HioX4ObKj5hpxFUeAYUks8dZJTPgFIfWqx5V3aoDFEzDPUuE44IRDvsv9t
	zCJGwLaSJ+P6TmUYc2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1VA-002ATO-0H;
	Fri, 15 Dec 2023 06:16:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1V7-002ASA-0E
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 06:16:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28659348677so202218a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702620999; x=1703225799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9EIXmi9RDoP7rccsl9U0oMb2l9OcBTii8Dhub5RMMk=;
        b=aeokjZCoY/ki51vKLLFQqJDf/ftM4M24012pGeiidquDjzmeIPMpz3Z6zjd021GVPa
         Pz9jTdT9l6hI7nVXGMBKfXHY24AcgN6hjKSG/q6k2/RlIEyCFgl1YAruFdRf5d+ijGMC
         9hpzzYZJH91gjOASCpPdRsk9mASsMrBdT1j8iIfgpbemAGUFzj83idY91OChhMTX8uG4
         rTGufxwILEpGb/h5JOWPyCBOyoSfBHZ+QRCecOUgE70IdKU6lJ4lHyHLxxdhd0vIip/l
         GrZ/o6CyqXk6gFqPJwsEkDBeQZlMLuI388vhELXW2jRcnodMPrar2xPDSbX99pKaaFHJ
         E8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702620999; x=1703225799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9EIXmi9RDoP7rccsl9U0oMb2l9OcBTii8Dhub5RMMk=;
        b=pawFznvbI+uytVdTs0uMoXFpxJzlk3nNtWGgGHw9r3jsbL9mvqKWRUH1O5eGiz/u/v
         hamQt80DM0NKvxLByLVo2wIJvS4NE2g/xV1Xubyvwva2rnSeQ1hJV/qU1s5ugREce8/x
         RLYraXjR6fn9unKrJGU2AAK4QmNcLsTlhqS1L5E/6xGN3euZxh8EYgS0UwEiUqtCx7BH
         6kUFLxPq0pP55a+/0+YG+Spe/KzDmsquyyv4bJX0xHGzYVgHKxCdLSN2zMZ0rW+eVIvs
         i6KrarecKx1xUFK5gUicnClbUVlffLzZBRQN1hny3GV++WlupoWMuRPv81PMBeZY6Vi2
         gcxQ==
X-Gm-Message-State: AOJu0YzQaZ61OLCG7ygXgaXAavFOnu6jXwWlZwgzIbx6rEuslqeG5yWm
	aYByCKICbM9eNvvwRVRBBZSRv/qNMdVgIj5sR804nQ==
X-Google-Smtp-Source: AGHT+IFjhL7dlHllUS2KAD8BgI4rWoZajkqicwug9dHFSlvZnSWL6mrvQEvs4yUR2Rdz1L4VbeFgSoZsfiB9WJgF9Ws=
X-Received: by 2002:a17:90b:911:b0:28b:7d0:17fa with SMTP id
 bo17-20020a17090b091100b0028b07d017famr3050811pjb.31.1702620998930; Thu, 14
 Dec 2023 22:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-20-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-20-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 11:46:26 +0530
Message-ID: <CAAhSdy0UKQ6v9yVxnyAjPEkpEkOLpsKXqUKccQLpzmPVwcQP2Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] RISC-V: KVM: Add steal-update vcpu request
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_221645_138272_7BA98542 
X-CRM114-Status: GOOD (  19.39  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbmV3IHZjcHUgcmVxdWVzdCB0byBpbmZv
cm0gYSB2Y3B1IHRoYXQgaXQgc2hvdWxkIHJlY29yZCBpdHMKPiBzdGVhbC10aW1lIGluZm9ybWF0
aW9uLiBUaGUgcmVxdWVzdCBpcyBtYWRlIGVhY2ggdGltZSBpdCBoYXMgYmVlbgo+IGRldGVjdGVk
IHRoYXQgdGhlIHZjcHUgdGFzayB3YXMgbm90IGFzc2lnbmVkIGEgY3B1IGZvciBzb21lIHRpbWUs
Cj4gd2hpY2ggaXMgZWFzeSB0byBkbyBieSBtYWtpbmcgdGhlIHJlcXVlc3QgZnJvbSB2Y3B1LWxv
YWQuIFRoZSByZWNvcmQKPiBmdW5jdGlvbiBpcyBqdXN0IGEgc3R1YiBmb3Igbm93IGFuZCB3aWxs
IGJlIGZpbGxlZCBpbiB3aXRoIHRoZSByZXN0Cj4gb2YgdGhlIHN0ZWFsLXRpbWUgc3VwcG9ydCBm
dW5jdGlvbnMgaW4gZm9sbG93aW5nIHBhdGNoZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdS5jICAgICAgICAgICAgIHwgNSArKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9z
dGEuYyAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggMGVlZmQ5Yzk5MWFlLi4yMzBiODJj
MzExOGQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTQxLDYgKzQxLDcg
QEAKPiAgICAgICAgIEtWTV9BUkNIX1JFUV9GTEFHUyg0LCBLVk1fUkVRVUVTVF9XQUlUIHwgS1ZN
X1JFUVVFU1RfTk9fV0FLRVVQKQo+ICAjZGVmaW5lIEtWTV9SRVFfSEZFTkNFICAgICAgICAgICAg
ICAgICBcCj4gICAgICAgICBLVk1fQVJDSF9SRVFfRkxBR1MoNSwgS1ZNX1JFUVVFU1RfV0FJVCB8
IEtWTV9SRVFVRVNUX05PX1dBS0VVUCkKPiArI2RlZmluZSBLVk1fUkVRX1NURUFMX1VQREFURSAg
ICAgICAgICAgS1ZNX0FSQ0hfUkVRKDYpCj4KPiAgZW51bSBrdm1fcmlzY3ZfaGZlbmNlX3R5cGUg
ewo+ICAgICAgICAgS1ZNX1JJU0NWX0hGRU5DRV9VTktOT1dOID0gMCwKPiBAQCAtMzcyLDQgKzM3
Myw2IEBAIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaGFzX2ludGVycnVwdHMoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1NjQgbWFzayk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG93ZXJfb2ZmKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfcG93ZXJfb24oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KTsKPgo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90
aW1lKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gKwo+ICAjZW5kaWYgLyogX19SSVNDVl9LVk1f
SE9TVF9IX18gKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggYmYzOTUyZDFhNjIxLi42OTk1YjhiNjQxZTQgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jCj4gQEAgLTU0MSw2ICs1NDEsOCBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpCj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2FpYV9s
b2FkKHZjcHUsIGNwdSk7Cj4KPiArICAgICAgIGt2bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9TVEVB
TF9VUERBVEUsIHZjcHUpOwo+ICsKPiAgICAgICAgIHZjcHUtPmNwdSA9IGNwdTsKPiAgfQo+Cj4g
QEAgLTYxNCw2ICs2MTYsOSBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1
ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4KPiAgICAgICAgICAgICAgICAgaWYgKGt2bV9j
aGVja19yZXF1ZXN0KEtWTV9SRVFfSEZFTkNFLCB2Y3B1KSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBrdm1fcmlzY3ZfaGZlbmNlX3Byb2Nlc3ModmNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAg
ICBpZiAoa3ZtX2NoZWNrX3JlcXVlc3QoS1ZNX1JFUV9TVEVBTF9VUERBVEUsIHZjcHUpKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHZj
cHUpOwo+ICAgICAgICAgfQo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfc3RhLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IGluZGV4IDgzOTkx
MWRjZDgzNy4uZTI4MzUxYzk0ODhiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3N0YS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiBAQCAtOCw2
ICs4LDEwIEBACj4gICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gICNpbmNsdWRlIDxh
c20vc2JpLmg+Cj4KPiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArfQo+ICsKPiAgc3RhdGljIGludCBrdm1fc2JpX3N0
YV9zdGVhbF90aW1lX3NldF9zaG1lbShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgICAg
ICAgIHJldHVybiBTQklfRVJSX0ZBSUxVUkU7Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
