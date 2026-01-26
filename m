Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979DACF65DD
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cimvgTNCj4kk+y0jTHd9F4ncrRN3bDWQ4tS5rDvl7i8=; b=hxqYlpcAsBSTOg
	sXz/yGglvjJ+nyzG+34aIDvihyMFzqHZYc3KXm26duRIMYuSKE/jRjyxWmrI4dHi3BgDxx1YW0MlA
	xDeHlPXfTbXiLIz8Q+uCT7kASUAdKROOzp1IuUL6GcW2L0N2o8EfX5OdRtT0InhKbQbQimOvtSVmI
	bqBMDEb3ED8z4jQzAuMb7WNjtlG3+188cf70qdMsT60TzAbh7bT8VZg2vmp6wEzBS6v+7dmclvRax
	pGHSiySeOYLKfwhW4C6TElMio0vU+4v5M4/cGuKtux2MHjJNdrVjLhd3rGIHWy9NG2ng2G9RZvO1f
	L6QeWgxvD9YiNl2R3kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLs-0000000CNNM-2EMX;
	Mon, 26 Jan 2026 11:01:48 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKLq-0000000CNMW-3eyu
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 11:01:47 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-4058fd4666eso2673432fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 03:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769425306; cv=none;
        d=google.com; s=arc-20240605;
        b=gjV9wdKpgRFzlbqHOx+0gvYYaP2aan5swk7xVtRrw16a9w0HhmU8WaZIA+yEEPYbm8
         0YjE8gUOPepIGT8Zc/kGceqXRI8hD4KSHOAcNMdFhhnVmV4Q7G9r2V0n6mbHagRmrAzz
         ntTTovYWVoGiS2+yZzVRFKQixMoHCyZvh4bCQ1rhRYxkqJkn66NpDE0rmzMqswYCSj1W
         FnZArI/r//2IuOsfMvXwyhPXmIT1x7QI3TYA+Kqjp1fs4R3LBWITG0aSno0zk/x6cBgy
         pVlMOPRZkbshoceamn/bJhbEL/L4yqpBlwdpB5mhtEJEWLwpJzU8wcC39hS0xBIw2us7
         rWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        fh=We9q42OJpikivksZXi9wH1RMKz5i65hUxf+YvJeG+RU=;
        b=cmXUXKnNkAQYkR5eVIqIj8F9IBXOIjWxVKfw83kN3AOM3dPeM6P6ptcpmct9tdkPMK
         BD8sWpEymLdacts2l/DWFZzhfJSKthOP0dhK5b7zBmkcCNBv8BNB0eyTXUch4QRcjeCN
         /jicGJdWcMJD5nFR2Fx84YYg+FQQRnh/TidlQj1FTHtunQi1pDNwNkZF8QGweTn1wuiR
         nYo46Bgzj16BNFukEjY5lR1QFCZI5GIlLJJOjAQy7wCnNbARxMKfQhm01QttfoQkHv9S
         V+KqMuoujARIKo1yCvFbzVd3fRKxDGU8LQGTACxXlhbcyQ+jDVK5nGHHz08jPrL1nJPB
         7GzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769425306; x=1770030106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        b=S+pw8wzO/z+94Kw5dsXGWlmdEky/05AtYvKrRTCkTu3xk2Tv9TdGePzvEWawJNgW52
         /Cv3tsWEdzR5kyqB1jqEsFLwe1X7d+UUopTye9RYpU2UedW3SgraaBHKqFsL2MaAFSU4
         n3I1wIqRzcEDQ2zN/FJD1sJkBT9hbURPaNyI6MYpMQs0yFscHN7C1sbMTVDP+QddcUsI
         dhT8tfM4woMgOAi9JsSo97/1D/kMMnjX8ftzOnPHvF28QgzbZaWFeeAAutqbKwdRjKpK
         6sYPeZMrX9tjByNW4nBLn4Rj0RFs+Or0fQRfb4u37G144rgC3xCwrSBGC4LKZGzh3xUd
         4KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425306; x=1770030106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNQC2GhUUe78LWTdamvuxQ+2JSUG6qZ/+66tSASqYfI=;
        b=Ekq/oXRcti1JqTUbVo2XFksALosiv/sW0ikuLVVSV8FyBrb7GHUla7sbL2qeqvPre6
         yGfET1FaFJgJRn6COlhPe01tM2G3QrRpjGnfsN7J/baEXBc8oh/HPKr1Ews9O2gLmVbJ
         D4FtKBsAhPGsjlpwx7ESYFkQxnDwEGjn5CwDEWWq+Ka335aVf0c8LVpd/hQeWWZE7uWK
         ZnOOXSXSCesJg0kvD/QmMptGHvgensak3bz3S9jsLl0Qv2tlGMqUm5s+pio5qBbYC5h8
         awUCa7nyU2lsCS+DACQ/JofemJnpTO97e2aDaPxclMSGNptEamVyxFE+qSor2BaCuysC
         OBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkQOFWAOokdT+JqOl0SYWyO61mJCCDYcj0Jfnvxc0LSMuwbNmpiBxsPo1q5h5U+L9lYYVhCSMrkbEA6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXctzTAnmaPi4ZuDDxHzo9tgz1ZZXvnuCKSiCui7v8HpLFonKK
	VCtEiUPvKEMbpBPH9X8t51m09cFe2nwHjMrM4JA5ReI/SlrlK1bBC/GwIb8FXa+ebt0+1YA0mWQ
	cGk3neoEV/bgzqFUyqLFw+X9Yn2CVXBOPZJI2wkwe4A==
X-Gm-Gg: AZuq6aJ2dsR6DmDWotWyZDoXMugBtdgcm1W1lU1cQNyn1Dhp02RDg5R1tuCKdCSLeud
	gtrxJAn07CEGlek3HhEu8DKfO3DTzROhtDAiWcveHe2ZaFKFTHXjJcPg0sm/bpV8DXzItrxmUbK
	HPuclf8JcoQggAuIsop3E55gcXaefoCFoU3D1IlJniBpFbgJp3rL6+y60siGKYIjvv+zgKGvVoE
	kegb/o23F4Ari2+a7WAmgYhafVEgdvmwAR1yO+92C2yW8FQVd7KlIca3PCZpVrnN4HqHebAj7re
	2VH6YQ9BO4qAhrdk+vdUysAIVwzR80RPIl0KdwNAGzyn+OsL3ZvlYYMZdw==
X-Received: by 2002:a4a:e84a:0:b0:659:9a49:8f99 with SMTP id
 006d021491bc7-662e03daedamr1690050eaf.18.1769425305682; Mon, 26 Jan 2026
 03:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jan 2026 16:31:32 +0530
X-Gm-Features: AZwV_QhwclxTcj0A8174pE-hkh_gKAJoKfsUQlzQMfllaSIpHrjIxI6lcFRhMeg
Message-ID: <CAAhSdy03Ujgn0K7xQNFoydWDiohU5PE6bbSt=tPLCBHd7BaZYw@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030146_926608_AF280333 
X-CRM114-Status: GOOD (  23.70  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgODowM+KAr1BNIEppYWthaSBYdSA8amlha2FpcGVhbnV0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBudWxsIHBvaW50ZXIgY2hlY2sgZm9yIGltc2lj
X3N0YXRlIGJlZm9yZSBkZXJlZmVyZW5jaW5nIGl0IGluCj4ga3ZtX3Jpc2N2X2FpYV9pbXNpY19o
YXNfYXR0cigpLiBXaGlsZSB0aGUgZnVuY3Rpb24gY2hlY2tzIHRoYXQgdGhlCj4gdmNwdSBleGlz
dHMsIGl0IGRvZXNuJ3QgdmVyaWZ5IHRoYXQgdGhlIHZjcHUncyBpbXNpY19zdGF0ZSBoYXMgYmVl
bgo+IGluaXRpYWxpemVkLCBsZWFkaW5nIHRvIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIHdo
ZW4gYWNjZXNzZWQuCj4KPiBUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIGR1cmluZyBmdXp6aW5n
IG9mIFJJU0MtViBLVk0gY29kZS4gVGhlCj4gY3Jhc2ggb2NjdXJzIHdoZW4gdXNlcnNwYWNlIGNh
bGxzIEtWTV9IQVNfREVWSUNFX0FUVFIgaW9jdGwgb24gYW4KPiBBSUEgSU1TSUMgZGV2aWNlIGJl
Zm9yZSB0aGUgSU1TSUMgc3RhdGUgaGFzIGJlZW4gZnVsbHkgaW5pdGlhbGl6ZWQKPiBmb3IgYSB2
Y3B1Lgo+Cj4gVGhlIGNyYXNoIG1hbmlmZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAw
MQo+ICAgLi4uCj4gICBlcGMgOiBrdm1fcmlzY3ZfYWlhX2ltc2ljX2hhc19hdHRyKzB4NDY0LzB4
NTBlCj4gICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo5OTgKPiAgIC4uLgo+ICAga3ZtX3Jp
c2N2X2FpYV9pbXNpY19oYXNfYXR0cisweDQ2NC8weDUwZSBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYzo5OTgKPiAgIGFpYV9oYXNfYXR0cisweDEyOC8weDJiYyBhcmNoL3Jpc2N2L2t2bS9haWFf
ZGV2aWNlLmM6NDcxCj4gICBrdm1fZGV2aWNlX2lvY3RsX2F0dHIgdmlydC9rdm0va3ZtX21haW4u
Yzo0NzIyIFtpbmxpbmVdCj4gICBrdm1fZGV2aWNlX2lvY3RsKzB4Mjk2LzB4Mzc0IHZpcnQva3Zt
L2t2bV9tYWluLmM6NDczOQo+ICAgLi4uCj4KPiBUaGUgZml4IGFkZHMgYSBjaGVjayB0byByZXR1
cm4gLUVOT0RFViBpZiBpbXNpY19zdGF0ZSBpcyBOVUxMLCB3aGljaAo+IGlzIGNvbnNpc3RlbnQg
d2l0aCBvdGhlciBlcnJvciBoYW5kbGluZyBpbiB0aGUgZnVuY3Rpb24gYW5kIHByZXZlbnRzCj4g
dGhlIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZS4KPgo+IEZpeGVzOiA1NDYzMDkxYTUxY2YgKCJS
SVNDLVY6IEtWTTogRXhwb3NlIElNU0lDIHJlZ2lzdGVycyBhcyBhdHRyaWJ1dGVzIG9mIEFJQSBp
cnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5h
Yy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpR
dWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4yMAoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiBW
MyAtPiBWNDogRml4IHR5cG8gaW4gU2lnbmVkLW9mZi1ieSBlbWFpbCBhZGRyZXNzLgo+IFYyIC0+
IFYzOiBNb3ZlZCBpc2VsIGFzc2lnbm1lbnQgYWZ0ZXIgaW1zaWNfc3RhdGUgTlVMTCBjaGVjay4K
PiAgICAgICAgICAgUGxhY2VkIHBhdGNoIHZlcnNpb24gaGlzdG9yeSBhZnRlciAnLS0tJyBzZXBh
cmF0b3IuCj4gICAgICAgICAgIEFkZGVkIHBhcmVudGhlc2VzIHRvIGZ1bmN0aW9uIG5hbWUgaW4g
c3ViamVjdC4KPiBWMSAtPiBWMjogQWRkZWQgRml4ZXMgdGFnIGFuZCBkcm9wIGV4dGVybmFsIGxp
bmsgYXMgc3VnZ2VzdGVkLgo+Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgNSArKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9h
aWFfaW1zaWMuYwo+IGluZGV4IGU1OTdlODY0OTFjM2IuLmNkMDcwZDgzNjYzYTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9h
aWFfaW1zaWMuYwo+IEBAIC05OTMsOCArOTkzLDExIEBAIGludCBrdm1fcmlzY3ZfYWlhX2ltc2lj
X2hhc19hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlKQo+ICAgICAgICAg
aWYgKCF2Y3B1KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPgo+IC0gICAgICAg
aXNlbCA9IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAg
aW1zaWMgPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYg
KCFpbXNpYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICsgICAgICAg
aXNlbCA9IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAg
cmV0dXJuIGltc2ljX21yaWZfaXNlbF9jaGVjayhpbXNpYy0+bnJfZWl4LCBpc2VsKTsKPiAgfQo+
Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
