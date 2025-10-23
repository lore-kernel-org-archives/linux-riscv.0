Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E39CCD1BF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY/Ro53SxrOQSd2R95oYCbivZxApPDWLEsQZeODYRJo=; b=lME0p8Ge0o6pdA
	bK38tOcIjQbgpUbqL1qc8xcWxlgCs+D/g5IMR/c/3k/fWG/pQAfogUWTfPI8zMota2eYf8zEUJ5DF
	7TXx/YHj4bESnRkjTP2CNISqb4LMeDWXQ1V6n5X5k8coBOXy/+g8NbMykoZN3ac8GFqT+Ne5/ugwx
	4uUdbg0Vl7MLwZxZBbIeI3OlYzVPbafs7dkPSDtlEQ3MryI7Ee7rZlvSQqkl/mofhXFBBeHdbTk6j
	ELz/hdbWneH6j3x4hB3GP77P6PUQ+yJzuJw08CrDGswaeU+7JRLYhIgN3m2kndFZQY0YwS0EgB6dr
	8qhJUkq56J12Asgaa9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1km-00000007Vur-2qJ3;
	Thu, 23 Oct 2025 20:17:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1kk-00000007VuE-1jRI
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 20:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkzVhL/+U7KTZ+Wu2Xt5iRP9SLK+it5gBEjbIIA64Vk=;
	b=J0J7JreWRtnc+0L7qtz+0P5RTtGdyU/Vk9oqr2FoQ9MVcZQMEQ/xfbPbABRmRXFw5Uxm8C
	RcEaovFdB0dYdEe1+fk7Wi4mnBnOuInHoceHWjwvzgBUCgbrTJ7VR4vQS5p6lw45H/GLut
	ljI5yWqdGbIqeg6lH7m1czPPFJ05C/E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-OivIpowCNXGLOp68BpIWyw-1; Thu,
 23 Oct 2025 16:17:33 -0400
X-MC-Unique: OivIpowCNXGLOp68BpIWyw-1
X-Mimecast-MFC-AGG-ID: OivIpowCNXGLOp68BpIWyw_1761250651
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8652195608E;
	Thu, 23 Oct 2025 20:17:29 +0000 (UTC)
Received: from cmirabil.redhat.com (unknown [10.22.64.45])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DA49F30002D7;
	Thu, 23 Oct 2025 20:17:25 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: tglx@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	cmirabil@redhat.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dramforever@live.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lzampier@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	samuel.holland@sifive.com
Subject: Re: [PATCH v6 0/4] Add UltraRISC DP1000 PLIC support
Date: Thu, 23 Oct 2025 16:17:19 -0400
Message-ID: <20251023201721.549563-1-cmirabil@redhat.com>
In-Reply-To: <87zf9hwh5j.ffs@tglx>
References: <87zf9hwh5j.ffs@tglx>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_131742_523114_0A39106F 
X-CRM114-Status: GOOD (  27.02  )
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

SGkgVGhvbWFz4oCUCgpPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAwOToyOTo0NFBNICswMjAwLCBU
aG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMjMgMjAyNSBhdCAxNTowMCwgTHVj
YXMgWmFtcGllcmkgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBQ
TElDIGltcGxlbWVudGF0aW9uIGluIHRoZSBVbHRyYVJJU0MKPiA+IERQMTAwMCBTb0MuIFRoZSBV
Ui1DUDEwMCBjb3JlcyB1c2VkIGluIHRoZSBEUDEwMDAgaGF2ZSBhIGhhcmR3YXJlIGJ1ZyBpbgo+
ID4gdGhlaXIgUExJQyBjbGFpbSByZWdpc3RlciB3aGVyZSByZWFkaW5nIGl0IHdoaWxlIG11bHRp
cGxlIGludGVycnVwdHMgYXJlCj4gPiBwZW5kaW5nIGNhbiByZXR1cm4gdGhlIHdyb25nIGludGVy
cnVwdCBJRC4gVGhlIHdvcmthcm91bmQgdGVtcG9yYXJpbHkKPiA+IGRpc2FibGVzIGFsbCBpbnRl
cnJ1cHRzIGV4Y2VwdCB0aGUgZmlyc3QgcGVuZGluZyBvbmUgYmVmb3JlIHJlYWRpbmcgdGhlCj4g
PiBjbGFpbSByZWdpc3RlciwgdGhlbiByZXN0b3JlcyB0aGUgcHJldmlvdXMgc3RhdGUuCj4gPgo+
ID4gVGhlIGRyaXZlciBtYXRjaGVzIG9uICJ1bHRyYXJpc2MsY3AxMDAtcGxpYyIgKENQVSBjb3Jl
IGNvbXBhdGlibGUpLCBhbGxvd2luZwo+ID4gdGhlIHF1aXJrIHRvIGFwcGx5IHRvIGFsbCBTb0Nz
IHVzaW5nIFVSLUNQMTAwIGNvcmVzIChjdXJyZW50bHkgRFAxMDAwLAo+ID4gcG90ZW50aWFsbHkg
ZnV0dXJlIFNvQ3MpLgo+ID4KPiA+IENoYXJsZXMgTWlyYWJpbGUgKDMpOgo+ID4gICBkdC1iaW5k
aW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IGFkZCBVbHRyYVJJU0MgRFAxMDAwIFBMSUMKPiA+
ICAgaXJxY2hpcC9wbGljOiBlbmFibGUgb3B0aW1pemF0aW9uIG9mIGludGVycnVwdCBlbmFibGUg
c3RhdGUKPiAKPiAgICAgVGhhdCBvbmUgbmV2ZXIgc2hvd2VkIHVwLiBOZWl0aGVyIGluIG15IGlu
Ym94IG5vciBvbiBsb3JlCgpMb29rcyBsaWtlIHRoZSBDQyBsaXN0IHdhcyBtaXNzaW5nIHNvbWVo
b3cgZnJvbSB0aGF0IHBhdGNo4oCUSSBkaWRuJ3Qgbm90aWNlIGJlY2F1c2UgSSBnb3QgaXQgaW4g
bXkgaW5ib3ggYmVjYXVzZSBvZiBteSBTaWduZWQtb2ZmLWJ5LgoKVGhlIGluZGV4aW5nIG9uIHRo
ZSBwYXRjaGVzIHdhcyBzbGlnaHRseSB3cm9uZyBhbnl3YXlzLCBzbyB3ZSB3aWxsIHJlc2VuZCB0
b21vcnJvdy4gU29ycnkgZm9yIHRoZSBub2lzZS4KCkkgaGF2ZSBhdHRhY2hlZCBpdCBoZXJlIGlu
IGNhc2UgeW91IHdhbnQgdG8gdGFrZSBhIGxvb2suCgo+IAotLSA+OCAtLQpGcm9tOiBDaGFybGVz
IE1pcmFiaWxlIDxjbWlyYWJpbEByZWRoYXQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggdjYgMy80XSBp
cnFjaGlwL3BsaWM6IGVuYWJsZSBvcHRpbWl6YXRpb24gb2YgaW50ZXJydXB0IGVuYWJsZSBzdGF0
ZQoKT3B0aW1pemUgdGhlIFBMSUMgZHJpdmVyIGJ5IG1haW50YWluaW5nIHRoZSBpbnRlcnJ1cHQg
ZW5hYmxlIHN0YXRlIGluCnRoZSBoYW5kbGVyJ3MgZW5hYmxlX3NhdmUgYXJyYXkgZHVyaW5nIG5v
cm1hbCBvcGVyYXRpb24gcmF0aGVyIHRoYW4gb25seQpkdXJpbmcgc3VzcGVuZC9yZXN1bWUuIFRo
aXMgZWxpbWluYXRlcyB0aGUgbmVlZCB0byByZWFkIGVuYWJsZSByZWdpc3RlcnMKZHVyaW5nIHN1
c3BlbmQgYW5kIG1ha2VzIHRoZSBlbmFibGUgc3RhdGUgaW1tZWRpYXRlbHkgYXZhaWxhYmxlIGZv
cgpvdGhlciBvcHRpbWl6YXRpb25zLgoKTW9kaWZ5IF9fcGxpY190b2dnbGUoKSB0byB0YWtlIGEg
aGFuZGxlciBwb2ludGVyIGluc3RlYWQgb2YgZW5hYmxlX2Jhc2UsCmFsbG93aW5nIGl0IHRvIHVw
ZGF0ZSBib3RoIHRoZSBoYXJkd2FyZSByZWdpc3RlcnMgYW5kIHRoZSBjYWNoZWQKZW5hYmxlX3Nh
dmUgc3RhdGUgYXRvbWljYWxseSB3aXRoaW4gdGhlIGV4aXN0aW5nIGVuYWJsZV9sb2NrIHByb3Rl
Y3Rpb24uCgpSZW1vdmUgdGhlIHN1c3BlbmQtdGltZSBlbmFibGUgcmVnaXN0ZXIgcmVhZGluZyBz
aW5jZSBlbmFibGVfc2F2ZSBub3cKYWx3YXlzIHJlZmxlY3RzIHRoZSBjdXJyZW50IHN0YXRlLgoK
U2lnbmVkLW9mZi1ieTogQ2hhcmxlcyBNaXJhYmlsZSA8Y21pcmFiaWxAcmVkaGF0LmNvbT4KCi0t
LQogZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIHwgMzYgKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMu
YyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwppbmRleCBjYmQ3Njk3YmMxNDgx
Li5kNTE4YThiNDY4NzQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1w
bGljLmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCkBAIC05NCwxNSAr
OTQsMjIgQEAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBwbGljX2hhbmRsZXIsIHBsaWNf
aGFuZGxlcnMpOwogCiBzdGF0aWMgaW50IHBsaWNfaXJxX3NldF90eXBlKHN0cnVjdCBpcnFfZGF0
YSAqZCwgdW5zaWduZWQgaW50IHR5cGUpOwogCi1zdGF0aWMgdm9pZCBfX3BsaWNfdG9nZ2xlKHZv
aWQgX19pb21lbSAqZW5hYmxlX2Jhc2UsIGludCBod2lycSwgaW50IGVuYWJsZSkKK3N0YXRpYyB2
b2lkIF9fcGxpY190b2dnbGUoc3RydWN0IHBsaWNfaGFuZGxlciAqaGFuZGxlciwgaW50IGh3aXJx
LCBpbnQgZW5hYmxlKQogewotCXUzMiBfX2lvbWVtICpyZWcgPSBlbmFibGVfYmFzZSArIChod2ly
cSAvIDMyKSAqIHNpemVvZih1MzIpOworCXUzMiBfX2lvbWVtICpiYXNlID0gaGFuZGxlci0+ZW5h
YmxlX2Jhc2U7CiAJdTMyIGh3aXJxX21hc2sgPSAxIDw8IChod2lycSAlIDMyKTsKKwlpbnQgZ3Jv
dXAgPSBod2lycSAvIDMyOworCXUzMiB2YWx1ZTsKKworCXZhbHVlID0gcmVhZGwoYmFzZSArIGdy
b3VwKTsKIAogCWlmIChlbmFibGUpCi0JCXdyaXRlbChyZWFkbChyZWcpIHwgaHdpcnFfbWFzaywg
cmVnKTsKKwkJdmFsdWUgfD0gaHdpcnFfbWFzazsKIAllbHNlCi0JCXdyaXRlbChyZWFkbChyZWcp
ICYgfmh3aXJxX21hc2ssIHJlZyk7CisJCXZhbHVlICY9IH5od2lycV9tYXNrOworCisJaGFuZGxl
ci0+ZW5hYmxlX3NhdmVbZ3JvdXBdID0gdmFsdWU7CisJd3JpdGVsKHZhbHVlLCBiYXNlICsgZ3Jv
dXApOwogfQogCiBzdGF0aWMgdm9pZCBwbGljX3RvZ2dsZShzdHJ1Y3QgcGxpY19oYW5kbGVyICpo
YW5kbGVyLCBpbnQgaHdpcnEsIGludCBlbmFibGUpCkBAIC0xMTAsNyArMTE3LDcgQEAgc3RhdGlj
IHZvaWQgcGxpY190b2dnbGUoc3RydWN0IHBsaWNfaGFuZGxlciAqaGFuZGxlciwgaW50IGh3aXJx
LCBpbnQgZW5hYmxlKQogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlyYXdfc3Bpbl9sb2NrX2ly
cXNhdmUoJmhhbmRsZXItPmVuYWJsZV9sb2NrLCBmbGFncyk7Ci0JX19wbGljX3RvZ2dsZShoYW5k
bGVyLT5lbmFibGVfYmFzZSwgaHdpcnEsIGVuYWJsZSk7CisJX19wbGljX3RvZ2dsZShoYW5kbGVy
LCBod2lycSwgZW5hYmxlKTsKIAlyYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGFuZGxlci0+
ZW5hYmxlX2xvY2ssIGZsYWdzKTsKIH0KIApAQCAtMjQ3LDMzICsyNTQsMTYgQEAgc3RhdGljIGlu
dCBwbGljX2lycV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBl
KQogCiBzdGF0aWMgaW50IHBsaWNfaXJxX3N1c3BlbmQodm9pZCkKIHsKLQl1bnNpZ25lZCBpbnQg
aSwgY3B1OwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0JdTMyIF9faW9tZW0gKnJlZzsKIAlzdHJ1
Y3QgcGxpY19wcml2ICpwcml2OwogCiAJcHJpdiA9IHBlcl9jcHVfcHRyKCZwbGljX2hhbmRsZXJz
LCBzbXBfcHJvY2Vzc29yX2lkKCkpLT5wcml2OwogCiAJLyogaXJxIElEIDAgaXMgcmVzZXJ2ZWQg
Ki8KLQlmb3IgKGkgPSAxOyBpIDwgcHJpdi0+bnJfaXJxczsgaSsrKSB7CisJZm9yICh1bnNpZ25l
ZCBpbnQgaSA9IDE7IGkgPCBwcml2LT5ucl9pcnFzOyBpKyspIHsKIAkJX19hc3NpZ25fYml0KGks
IHByaXYtPnByaW9fc2F2ZSwKIAkJCSAgICAgcmVhZGwocHJpdi0+cmVncyArIFBSSU9SSVRZX0JB
U0UgKyBpICogUFJJT1JJVFlfUEVSX0lEKSk7CiAJfQogCi0JZm9yX2VhY2hfcHJlc2VudF9jcHUo
Y3B1KSB7Ci0JCXN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIgPSBwZXJfY3B1X3B0cigmcGxp
Y19oYW5kbGVycywgY3B1KTsKLQotCQlpZiAoIWhhbmRsZXItPnByZXNlbnQpCi0JCQljb250aW51
ZTsKLQotCQlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmhhbmRsZXItPmVuYWJsZV9sb2NrLCBmbGFn
cyk7Ci0JCWZvciAoaSA9IDA7IGkgPCBESVZfUk9VTkRfVVAocHJpdi0+bnJfaXJxcywgMzIpOyBp
KyspIHsKLQkJCXJlZyA9IGhhbmRsZXItPmVuYWJsZV9iYXNlICsgaSAqIHNpemVvZih1MzIpOwot
CQkJaGFuZGxlci0+ZW5hYmxlX3NhdmVbaV0gPSByZWFkbChyZWcpOwotCQl9Ci0JCXJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZoYW5kbGVyLT5lbmFibGVfbG9jaywgZmxhZ3MpOwotCX0KLQog
CXJldHVybiAwOwogfQoKLS0KMi41MS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
