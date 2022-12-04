Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3614C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 04:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjsfHQ8tS/uv+6Yi3rQzNBNyGL1AekqPcR+430PoGw0=; b=EtVKLn4XeD/J6z
	PpauALtJZlr7OR2ESaubVHhnAqNkAmawZGm7S5YqTr6WUTPDhfV2oro2ys0MsjZsdCnjVMGWiFOjx
	i9fsk9vF6EUnkH0MvfYKD0FRbSIFshxNCCz4/FjPAf1JMyPfzSZPZRVMLdMjqrrQ7hWkhtB7J/Rq4
	pSZMmn1eBdmiWdefeb0d1KuKlZ+dvXgRvn0aar22EwXADvn7Cob+zrYVBIKcJG6srtuw+cRb+mvu4
	pQzr46aZBDj1gPZSpyiXj5PkfWDSJEpLmDs+kv2kwS3NSGnwqYcUboC1UtIFT8ErMTmjzkizpA+Yh
	lQf4yCSsDb08nciXkNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1gxw-006Tue-Ln; Sun, 04 Dec 2022 04:51:00 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1gxt-006Tt9-G2
	for linux-riscv@lists.infradead.org; Sun, 04 Dec 2022 04:50:58 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id e141so10674268ybh.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 20:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=k5mVMRjqX7Si5uG9z+Uscvrtps9Lm4l+J08vtkBLLMictjduN7yw83tsE++Hu+Y+Aj
         tzGMjHp1B1DVBsHBeaAno3yi2BVO1izqPQNjfE9efhoNad2WkUqtmN+u5ck7CRIJRDjF
         YM/dl+7BGD8/nxeEUA1XSJ81WAfcs6vkCLEGMF0P2bL6CTiqD6TUfX0qPUwprGQelNlI
         Y8aZ2lCfq+dEaYid+X7MscI8qzgPVVQAZJUwygBrxro7blbU3pOBNekJtI9+G2UshZ3G
         GHc7S9u550foOhzqlp8cvkhkpghQSTF1P8bew1u3cg2NPkmwUqUch+maLgoYjzwwvL3H
         yPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=kbuK8EpaQaih13m32C+n416lx8i5xq1OCsYX1Q1SroJpaYhMfAeZoVme4Q7Aq9D1q/
         knVCguXH9Pxi4xnvq11ipGFfUPWUaUmmpp/dKXUv9l2b5c6Ai1lhQSUb9QaKyJio70Mb
         lHYr90Wyujy7PlwHQsVcWTnEqg9KnR4bcIvZdzZurwEWzYe8BH3caThr22QfTni3r4mV
         tJTj01WgQj5tnQ/UQBlu6vIjI7e3ieyNaYmQJr6z6lmb4xj4vvrdSRxeU3B8bAjI1R0M
         pQg+E+zLQqAAaFTlNILFk4tqLto8tc7MFwCx3Ds0UdNyF+bjyMhnGSwR6TcuUCbtYbVn
         IzpA==
X-Gm-Message-State: ANoB5pkjah/oug1//K2+TDEtjCieaW4adyL0ABkRnovdxzrZ3UnzzEdm
	XWPY+JRUTPgGJJF2E+pWQVduEjZbH5MHFJAAhIEAsQ==
X-Google-Smtp-Source: AA0mqf52pBcclC9lDKWIBghKNsRoQBaHiaJZlm0JdUCM7v2WBwAs6EPMpN3sOutADe/7qyKy21QWPgWJqBBadM6ij9I=
X-Received: by 2002:a25:ae08:0:b0:6fc:e336:3785 with SMTP id
 a8-20020a25ae08000000b006fce3363785mr10299755ybj.166.1670129451952; Sat, 03
 Dec 2022 20:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu> <20221115004625.x4wl6zbg4iiuxl5t@google.com>
In-Reply-To: <20221115004625.x4wl6zbg4iiuxl5t@google.com>
From: Fangrui Song <maskray@google.com>
Date: Sat, 3 Dec 2022 20:50:40 -0800
Message-ID: <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_205057_571900_FE213BC3 
X-CRM114-Status: GOOD (  17.09  )
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

T24gTW9uLCBOb3YgMTQsIDIwMjIgYXQgNDo0NiBQTSBGYW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDIyLTExLTE0LCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Ogo+ID4KPiA+Cj4gPkxlIDI4LzA5LzIwMjIgw6AgMDc6MjUsIEZhbmdydWkgU29uZyBhIMOpY3Jp
dCA6Cj4gPj4gT24gU2F0LCBTZXAgMTAsIDIwMjIgYXQgMTI6NTMgQU0gRmFuZ3J1aSBTb25nIDxt
YXNrcmF5QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiAyMDIyLTA4LTMwLCBGYW5n
cnVpIFNvbmcgd3JvdGU6Cj4gPj4+PiBUaGUgYWN0dWFsIGludGVudGlvbiBpcyB0aGF0IG5vIGR5
bmFtaWMgcmVsb2NhdGlvbiBleGlzdHMuIEhvd2V2ZXIsIHNvbWUKPiA+Pj4+IEdOVSBsZCBwb3J0
cyBwcm9kdWNlIHVubmVlZGVkIFJfKl9OT05FLiAoSWYgYSBwb3J0IGlzIG5vdCBjYXJlIGVub3Vn
aCB0bwo+ID4+Pj4gZGV0ZXJtaW5lIHRoZSBleGFjdCAucmVsW2FdLmR5biBzaXplLCB0aGUgdHJh
aWxpbmcgemVyb3MgYmVjb21lIFJfKl9OT05FCj4gPj4+PiByZWxvY2F0aW9ucy4gRS5nLiBwb3dl
cnBjNjRsZSBsZCBhcyBvZiAyLjM4IGhhcyB0aGUgaXNzdWUgd2l0aAo+ID4+Pj4gZGVmY29uZmln
LikgUl8qX05PTkUgYXJlIGdlbmVyYWxseSBuby1vcCBpbiB0aGUgZHluYW1pYyBsb2FkZXJzLiBT
byBqdXN0Cj4gPj4+PiBpZ25vcmUgdGhlbS4KPiA+Pj4+Cj4gPj4+PiBXaXRoIHRoZSBjaGFuZ2Us
IHdlIGNhbiByZW1vdmUgQVJDSF9SRUxfVFlQRV9BQlMuIEFSQ0hfUkVMX1RZUEVfQUJTIGlzIGEK
PiA+Pj4+IGJpdCBtaXNub21lciBhcyBwb3J0cyBtYXkgY2hlY2sgUkVMQVZFVElWRS9HTE9CX0RB
VC9KVU1QX1NMT1Qgd2hpY2ggYXJlCj4gPj4+PiBub3QgY2FsbGVkICJhYnNvbHV0ZSByZWxvY2F0
aW9ucyIuIChUaGUgcGF0Y2ggaXMgbW90aXZhdGVkIGJ5IHRoZSBhcm02NAo+ID4+Pj4gcG9ydCBt
aXNzaW5nIFJfQUFSQ0g2NF9SRUxBVElWRS4pCj4gPj4+Pgo+ID4+Pj4gV2hpbGUgaGVyZSwgcmVw
bGFjZSAiZWdyZXAiIHdpdGggImdyZXAiIGFzICJlZ3JlcCIgaXMgZGVwcmVjYXRlZCBpbiBHTlUK
PiA+Pj4+IGdyZXAgMy43Lgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhbmdydWkgU29u
ZyA8bWFza3JheUBnb29nbGUuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiBbLi4uXQo+ID4+Pj4KPiA+
Pj4KPiA+Pj4gUGluZy4KPiA+Pgo+ID4+IFBpbmdeMiA6KQo+ID4KPiA+Q2FuIHlvdSBleHBsYWlu
IHdoaWNoIEFSQ0hfUkVMX1RZUEVfQUJTIGNhbiBiZSByZW1vdmVkIHdpdGggdGhpcyBjaGFuZ2Ug
Pwo+ID5Ib3cgaXMgdGhlIHZlcmlmaWNhdGlvbiBkb25lIGlmIEFSQ0hfUkVMX1RZUEVfQUJTIGlz
IHJlbW92ZWQgPwo+Cj4gQWxsIEFSQ0hfUkVMX1RZUEVfQUJTIHJlbG9jYXRpb24gdHlwZXMgY2Fu
IGJlIHJlbW92ZWQuIEFzIGV4cGxhaW5lZCwgdGhlCj4gcmVhbCBpbnRlbnRpb24gaXMgdG8gY2hl
Y2sgbm8gZHluYW1pYyByZWxvY2F0aW9uLCBhbmQgdGhpcyBpcyBkb25lIGJ5Cj4gdGhlIG5ldwo+
Cj4gICAgY21kX3Zkc29fY2hlY2sgPSBpZiAkKFJFQURFTEYpIC1yVyAkQCB8IGdyZXAgLXYgX05P
TkUgfCBncmVwIC1xICJSX1x3Kl8iOyBcCj4KPiBpbiB0aGlzIHBhdGNoLgo+Cj4gZ3JlcCAtdiBf
Tk9ORSBpcyB0byB3b3JrIGFyb3VuZCBzb21lIEdOVSBsZCBwb3J0cyAoYW5kIGxpa2VseSBvbGRl
ciByZWxlYXNlcwo+IG9mIHNvbWUgcG9ydHMgZXZlbiBpZiB0aGVpciBsYXRlc3QgdmVyc2lvbnMg
YXJlIGZpeGVkKSB3aGljaCBwcm9kdWNlCj4gdW5uZWVkZWQgUl8qX05PTkUgZHluYW1pYyByZWxv
Y2F0aW9ucy4KClBpbmcgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
