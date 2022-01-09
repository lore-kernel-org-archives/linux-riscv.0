Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDECC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qp3qQmONvRs+HZ4gaYC8qUQJzXM/8YH1oE6gPv366/A=; b=259TepHpLOyt+Og9y9Lb/LAW3N
	EX3RLrlwm7TFHJx+UoVrCzj3MUfJGnssoPPUc55FeVpult2B6ejnohEtoMS62gAP9M9wdU0wDfpiL
	t9Xo0QnCDx3l1spIhoK6XHaIZUHOCvOo5K3Q3ox9cnvR3WBG0/CjmIuR3DaSJBMpZeBH/Fi552Kt7
	QNDfPNSsQqmxOfb54PCeiguSL1Z+J6TeP9hwVAgQMTZgnm3ClvTeVtm1Keojsa1NgXt2Gf6bLQzZk
	733bdClwwyV3Zo26FgYCij505DgNwV/JK8EienyED5w2/D+w38tsnCXRq4BA2u51qjrdmxtWxfvFR
	P5WHddEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dNB-008Gcm-PG; Sun, 09 Jan 2022 18:56:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dN9-008GcN-5t
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 18:56:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 78so854557pfu.10
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wJEUw9ff5ZoyLDqzlPoT0/RMmRbe6oRM0UsL8abW2Hc=;
 b=nTW3bDU69D+maIKyxjfA6EnVwxU+mhMaNR5SCm/lYu7vEvl8ymOHumN8fBNq+OX+Mu
 yTq6u/xKNc7GPDJWaNOToTFg3dZ5cmgOvmoQ20gYdNMZeFPphC2pRDKDkGJxgX1jbDXq
 QvliYpvuMIXD2ENnu7p0OokAjEXoOY0OKh589ax8WNrIwQAcpbsRzk7ISDGME6hcfTzu
 8zsm/esLTe5a5vWid2Ki2BVcKuuhaeYsJghhu/mhgDCkOZxVTDcfJ/P5F1oXu1vTK6MZ
 XOd+cznTrxoaSh22tmlZDvHstM5yOjpy2g6S20yBQCFBpOfSOIfqa5MB+JLU7wBlddCR
 xksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wJEUw9ff5ZoyLDqzlPoT0/RMmRbe6oRM0UsL8abW2Hc=;
 b=hDMr3hUnCQHat3BPnW2gzRmKESthts9dklEtbGTEWjV4u64XFsZKFTFVZfbCqAyRsa
 AgsCVoIRmCY7m0kQolfHO+VtAfSoekKK97DQh0DiYIDexWnuecC4VyHJX2nuhDTIOGnx
 dX9Wynl2SE29CR6N7Jd4S2C2Bl7KVBvJt7uMM1P8X0uHm+mtEQS3VOwxaSHI2lf3xr7m
 60dw1PNEiYixIIXrod4jEtr60nL09eADtVEkpPsNocT2/mmVf3MS0hVRKrLVk1pYfd7g
 KRs3dnbTo5G/FNz93Un73CnghXWTdQTM2vKNug9kZyALqpeYc14VMO7ePwOAYa+loSn0
 MDXQ==
X-Gm-Message-State: AOAM531m0K//h0BawYbZynxqG5zls3ubZEHSkIiFveFpwhRYlxZMXDnu
 NUE9Zo/uODpUfjm5A3XhQoU34A==
X-Google-Smtp-Source: ABdhPJyr0zws2LdZ788TXsTMQDc/XOoIDXppwbYJus0GYLTDrTrLrpomN372UEv+yckAjiNujYAteQ==
X-Received: by 2002:a63:4a5f:: with SMTP id j31mr62757106pgl.222.1641754613260; 
 Sun, 09 Jan 2022 10:56:53 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d4sm4216032pfu.50.2022.01.09.10.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:56:52 -0800 (PST)
Date: Sun, 09 Jan 2022 10:56:52 -0800 (PST)
X-Google-Original-Date: Sun, 09 Jan 2022 10:55:49 PST (-0800)
Subject: Re: [PATCH 1/3] riscv: Don't use va_pa_offset on kdump
In-Reply-To: <70fe8aa8bfe3923308e6248377577f58@mailhost.ics.forth.gr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr,
 stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-d399244b-db6d-40e5-9113-77baf96bf987@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_105655_319926_94155454 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNyBKYW4gMjAyMiAxMDowMzo1OSBQU1QgKC0wODAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gSGVsbG8gUGFsbWVyLAo+Cj4gQW55IHVwZGF0ZXMgb24gdGhvc2UgMyBwYXRj
aGVzID8KClNvcnJ5LCBJIGhhZG4ndCByZWFsaXplZCB0aGVzZSB3ZXJlIGZpeGVzIHNvIHRoZXkg
Z290IHN0dWNrIGluIHRoZSAKcXVldWUwLiAgSSBkbyBub3cgcmVtZW1iZXIgeW91IHNheWluZyB5
b3UgaGFkIHNvbWUgZml4ZXMgYXQgdGhlIFJJU0MtViAKY29uZmVyZW5jZSwgYnV0IEkgZ3Vlc3Mg
dGhhdCBnb3QgbG9zdCBhcyB3ZWxsLiAgSW5jbHVkaW5nIHNvbWV0aGluZyBsaWtlIAoiZml4IiBv
ciAiLWZpeGVzIiBpbiBhIHN1YmplY3QgbGluZSBhbHdheXMgaGVscHMsIGJ1dCBpZiBJIG1pc3Mg
c3R1ZmYgCklSQydzIGFsd2F5cyBhIGdvb2QgYmV0IGFzIHRoYXQnbGwgYXQgbGVhc3QgbWFrZSBz
dXJlIEkgc2VlIGl0IHdoZW4gSSdtIAppbiBmcm9udCBvZiB0aGUgY29tcHV0ZXIgLS0gdGhlcmUn
cyBhIGxvdCBvZiBwZW9wbGUgd2hvIHdhbnQgdGhpbmdzIGF0IAp0aGVzZSBjb25mZXJlbmNlcy4K
Ckl0J3MgdG9vIGxhdGUgZm9yIGZpeGVzLCBidXQgaXQgbG9va3MgbGlrZSB0aGluZ3MgaGF2ZSBi
ZWVuIGJyb2tlbiBmb3IgYSAKd2hpbGUgc28gdGhlc2Ugd2lsbCBoYXZlIHRvIGFsbCBnZXQgYmFj
a3BvcnRlZCB0byBzdGFibGUgcmVnYXJkbGVzcy4KClRoaXMgaXMgb24gZm9yLW5leHQuCgpUaGFu
a3MhCgo+Cj4gUmVnYXJkcywKPiBOaWNrCj4KPiDOo8+EzrnPgiAyMDIxLTExLTI2IDIwOjA0LCBO
aWNrIEtvc3NpZmlkaXMgzq3Os8+BzrHPiM61Ogo+PiBPbiBrZHVtcCBpbnN0ZWFkIG9mIHVzaW5n
IGFuIGludGVybWVkaWF0ZSBzdGVwIHRvIHJlbG9jYXRlIHRoZSBrZXJuZWwsCj4+IHRoYXQgbGl2
ZXMgaW4gYSAiY29udHJvbCBidWZmZXIiIG91dHNpZGUgdGhlIGN1cnJlbnQga2VybmVsJ3MgbWFw
cGluZywKPj4gd2UganVtcCB0byB0aGUgY3Jhc2gga2VybmVsIGRpcmVjdGx5IGJ5IGNhbGxpbmcK
Pj4gcmlzY3Zfa2V4ZWNfbm9yZWxvY2F0ZSgpLgo+PiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biB1c2VzIHZhX3BhX29mZnNldCB3aGlsZSBzd2l0Y2hpbmcgdG8KPj4gcGh5c2ljYWwKPj4gYWRk
cmVzc2luZywgaG93ZXZlciBzaW5jZSB3ZSBtb3ZlZCB0aGUga2VybmVsIG91dHNpZGUgdGhlIGxp
bmVhcgo+PiBtYXBwaW5nCj4+IHRoaXMgd29uJ3Qgd29yayBhbnltb3JlIHNpbmNlIHJpc2N2X2tl
eGVjX25vcmVsb2NhdGUoKSBpcyBwYXJ0IG9mIHRoZQo+PiBrZXJuZWwgbWFwcGluZyBhbmQgd2Ug
c2hvdWxkIHVzZSBrZXJuZWxfbWFwLnZhX2tlcm5lbF9wYV9vZmZzZXQsIGFuZAo+PiBhbHNvCj4+
IHRha2UgWElQIGtlcm5lbCBpbnRvIGFjY291bnQuCj4+Cj4+IFdlIGRvbid0IHJlYWxseSBuZWVk
IHRvIHVzZSB2YV9wYV9vZmZzZXQgb24gcmlzY3Zfa2V4ZWNfbm9yZWxvY2F0ZSwgd2UKPj4gY2Fu
IGp1c3Qgc2V0IFNUVkVDIHRvIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBuZXcga2VybmVs
IGluc3RlYWQKPj4gYW5kCj4+IGxldCB0aGUgaGFydCBqdW1wIHRvIHRoZSBuZXcga2VybmVsIG9u
IHRoZSBuZXh0IGluc3RydWN0aW9uIGFmdGVyCj4+IHNldHRpbmcKPj4gU0FUUCB0byB6ZXJvLiBU
aGlzIGZpeGVzIGtkdW1wIGFuZCBpcyBhbHNvIHNpbXBsZXIvY2xlYW5lci4KPj4KPj4gSSB0ZXN0
ZWQgdGhpcyBvbiB0aGUgbGF0ZXN0IHFlbXUgYW5kIEhpRml2ZSBVbm1hdGNoZWQgYW5kIHdvcmtz
IGFzCj4+IGV4cGVjdGVkLgo+Pgo+PiB2MjogSSByZW1vdmVkIHRoZSBkaXJlY3QganVtcCBhZnRl
ciBzZXR0aW5nIHNhdHAgYXMgc3VnZ2VzdGVkLgo+Pgo+PiBGaXhlczogMmJmYzZjZDgxYmQxICgi
cmlzY3Y6IE1vdmUga2VybmVsIG1hcHBpbmcgb3V0c2lkZSBvZiBsaW5lYXIKPj4gbWFwcGluZyIp
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+
Cj4+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4+IENjOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjEzCj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVs
Lm9yZz4gIyA1LjE0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
