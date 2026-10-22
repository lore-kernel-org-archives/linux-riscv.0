Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729A606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AdqY7Nn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=nUL76c3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsqT9uAHDl+crHpdz2bblhb5hHdAPMxUKuQdp1NsXA0=; b=1AdqY7NngN/a9X
	9PJmoQLWt7+cZEUyItTEzHBDerIPsg4BGfeZpovcdNrIzQx2t9DNCZAPyqWkPppXJfI5u2wxIeMqy
	Z52PywbM9R2RblFdrdWcSo3VwrT98mgPJeW9LXNJ7fSHqEdcsU3xl/hXpci2C55RULpAhc0BRbKuR
	XRZWRRBDJahovG1Hv9uqB/JmM2DNUZGiNH+cfBHjYe+VMW9J8gjg5IdLle6xN2cTbT70J6wmfTs25
	3Ze/fEMFlhv/8kbZOmNDVzMTVejFcU7NY2/5id857t29Roe2jis2p32BnU9glCr48oUQPCP6Kvrk2
	zghjB0H+6tV+xiZP6zLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlDV-0000000DNFt-0rE8;
	Thu, 22 Oct 2026 05:19:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlDS-0000000DNEb-0NYq
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:19:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso959302f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646388; cv=none;
        d=google.com; s=arc-20260327;
        b=flTfp743KoqFZgb75pOOG35EVRBybdOGX8UtW/gtR1H02+b0eaPInCrGF+lwdS19KF
         MGNVISukkZ5VbuUle153d5UDPu6Ony9YsbGmh+kw5qDOXKhA0Ch55jMED07y3aMQ1OdS
         e8/n8YdzsCEDI7qyxqJ5uII0qiPlKADiTCF7EL5u+XCMmmAdUX1d0j6HMQ5fQwk5wQcX
         DkJazb20wBqp8W8b4cOuyqDccRYX/mlsfz2b1ryS0sw9C3Bxrn2uv6NFZiFxGTv/uOl8
         SMCtI218nMP7dVtHpuo9kHpmlPgFcE/n8GNzWbPTfgIvYYVyf4TtA8F4CEW8kQqwkwka
         Ujdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        fh=8Kq9zStJ5QLgn02ACuMR3wcItWzQycSlzuP12J84cEU=;
        b=olfsha6P+cnIw4DbRWQ9YNXgixsJCICCb9n4Kf8PbhFr6tW83kSa3G8QZeWYIuN7sv
         PHOAPJB9ACXh65PmydCcMiedAPtp8csdVRobSzDHP0xR0YmSZZC9yuXylBTHaS4GBwO1
         qcPvRQsZDqfSey5xIRhES2CS70gPe2498C2XKF/Fhzj0s9JXyNJH8M3JYBvOWCrzLr7n
         eE5XvcESlRmqTGU9Nvt2b2KWrFWu+QyxTJxFTkdI4DACKuA53AxYwK0TpoFF7E+/MT8d
         jlq5PeHNtWf5e03U8PL0CTgnnEukus5ADtGLbprM7fWQ22Bvw+7H99cBrAiduJWUWeGz
         Yerw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646388; x=1793251188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=nUL76c3I1CWxo7o9L2iiVGTlKZb2zDTIMD+Prjy41iVtGft/i9sbI/Wu9KJqLdDJCW
         sHbiiSUGCs2RwVOdjyQ3xGnhWv7/RIUJ/6bO0dUSWv62HUjA/PpgaNsUthVCU/Rxxa07
         5cLLgZ4nsiyMmUW7hf60F9bS1rK8QhKUVCF+2PHTLzKPq0HK9yRpEMfDTVdkPjWmBajC
         k6SCbK/O2HrzK80beK1zmz9dAW0QV5Cr/vTlk0/uVtf+PbxFNDg6eogy3bC0xb71WNs5
         OUyp1rx72gb9Q4m4f5+QlIEnVwYYZJ1kbkqaK55lB3DT82zg9P0x+FIqxYQbZUfY9jeI
         Kgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646388; x=1793251188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=bkFhnkUYpCIbYFChe+4vwfiY11C9sIXE4vka4YvuBPJJB5wyilN28D9XnLxBrRcqGn
         VvqwOfdYJv3f8MSrlkXZeOi/ielZDkXPF1TQhvukKzq5m1u8bTIvxmxzrXLBwyGc3QCY
         1twjKyVFc/AJbXgk+3TDFkhHhmMoKX5t9X35ENvPXhljy99PMXdf7f0nk2JPnCw6ViHZ
         Jr9mWWEopv90Iaolq3U7QiRau6xv4SJ65ApTmWABXU8yEdfjRws+hiv3byBh3uvh/8n1
         +OIt8Fru0vnVY4zVzIUQLjWE5VV3VOPDlYqxIG3CoeQt0F2lvBEayM3E9A4QQInOSdSs
         VwHg==
X-Forwarded-Encrypted: i=1; AKwUvBwoTEgtw0qTeCAqjxsqDs7pC8uBj0GaYRr/TBFLL5jcy9Vs9I3jrUbOYQHAgFGoSFbgNsgQnUuSY0cxuA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIdFJohUPTh/tPGD69nBjSM1z7pE4mckxAxdLwEg3cubjyRTgs+
	Sd1ZddTrj5X8+n89AHhYJxbY10cOkE0ct9Sd0Bg13agHru4brl5bGv5pTKL1KPYs1TR3T06+K/o
	4N1Mw90jt+Pt1WQjfOsTVKpyALbeEgLBZ1+SSQxl3vw==
X-Gm-Gg: AYBFou0FTuMYRIICVYNZuARaNd+NBYX1kqoOWXYi8hDKOP9zEuf8MWDncwC3Fn53mPs
	TykN+ZgpNMOoAKhyjmrJ63rJL3JnG+9RKyx0gacbPPLJWM93oL6StoYFaG4l893byxRurZPjkxI
	SGUVD+HJdfsphAgPAES0XPWFd70q32BFRjoqdM9WYS/lHTTGYiVVkS87VqvHm+Nglj4ok6Ur/5p
	HY6wzvif2qdbQCA1wtuTAJi6O6h4BW5gv+QpEiFugFI77hPByex7dq2XikWH9okgsxs4fd9Zba+
	jJn+HbgN2URvYSVNbSn6V0cWj2Y9Q4IlvpCtgT8gVfhzvTzwCUF0Va+kETaKoBslg2Ngtogg3Sh
	/tuQw4f17wzcYV8RhlrXJmpzkIMQDOS3AEH5XOCWPtlpNq8SURMOr5jndUz2MZeIgJyEjYzQyau
	bK3xZIkv4ROFjXops6g5TDoRynaj3PFphylrNfCL6ZfTEYE2Ccwlm/UIoO
X-Received: by 2002:a05:6000:2312:b0:48d:fa9c:7838 with SMTP id
 ffacd0b85a97d-48e2644efc7mr9279274f8f.2.1792646387426; Wed, 21 Oct 2026
 22:19:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:49:35 +0530
X-Gm-Features: AclHuK8p_QSaWeBtSoMEm3xKUDsy3StFk9vUIaP-8tnRvRCPH9rhzXhcbhlL-gk
Message-ID: <CAAhSdy1gh64bxcg_OpdWpCwHj3nb0V2Ub0AYXNeSOCnq08=o4g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221950_152612_493FC9F6 
X-CRM114-Status: GOOD (  20.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgOToyMeKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2lj
X3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2NoZWR1bGVyIHByZWVtcHRpb24KPiBub3RpZmllciB3
aGlsZSB0aGUgcmF3IHJ1bnF1ZXVlIGxvY2sgaXMgaGVsZC4gVGFraW5nIHZzZmlsZV9sb2NrLCBh
bgo+IHJ3bG9ja190LCB0aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3YWl0LWNvbnRleHQgcnVs
ZXMuCj4KPiBQcm90ZWN0IHRoZSBDUFUvSEdFSSBwYWlyIHdpdGggYSBzZXBhcmF0ZSByYXcgc3Bp
bmxvY2suIEFsbCB1cGRhdGVzIHRvCj4gdGhhdCBwYWlyIHJldGFpbiB2c2ZpbGVfbG9jayBhbmQg
dGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVkdWxlci1vdXQKPiB1c2VzIG9ubHkgdGhlIG5l
dyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUgdXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3YWtldXAKPiBz
ZXR1cCBzZXJpYWxpemVkIHdpdGggVlMtZmlsZSBwdWJsaWNhdGlvbiBhbmQgcmVsZWFzZSB3aXRo
b3V0IGJyaW5naW5nCj4gd2lkZXIgSU1TSUMgb3BlcmF0aW9ucyBpbnRvIGEgcmF3IGNyaXRpY2Fs
IHNlY3Rpb24uCj4KPiBGaXhlczogNGNlYzg5ZGI4MGJhICgiUklTQy1WOiBLVk06IE1vdmUgSEdF
SVtFfFBdIENTUiBhY2Nlc3MgdG8gSU1TSUMgdmlydHVhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+CgpJIGhhdmUg
cmVuYW1lZCBoZ2VpX2xvY2sgdG8gdnNmaWxlX2hnZWlfbG9jayBhdCB0aGUgdGltZSBvZiBtZXJn
aW5nLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1
ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCj4gaW5kZXggYzFhZjIzZTc5YWUwLi4xY2NiN2VhYzlmNDUgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYwo+IEBAIC00OCw2ICs0OCw4IEBAIHN0cnVjdCBpbXNpYyB7Cj4KPiAgICAgICAgIC8qIElN
U0lDIFZTLWZpbGUgKi8KPiAgICAgICAgIHJ3bG9ja190IHZzZmlsZV9sb2NrOwo+ICsgICAgICAg
LyogV3JpdGVycyBob2xkIGJvdGggbG9ja3M7IHNjaGVkdWxlci1vdXQgb25seSB0YWtlcyBoZ2Vp
X2xvY2suICovCj4gKyAgICAgICByYXdfc3BpbmxvY2tfdCBoZ2VpX2xvY2s7Cj4gICAgICAgICBp
bnQgdnNmaWxlX2NwdTsKPiAgICAgICAgIGludCB2c2ZpbGVfaGdlaTsKPiAgICAgICAgIHZvaWQg
X19pb21lbSAqdnNmaWxlX3ZhOwo+IEBAIC01ODIsNiArNTg0LDE3IEBAIHN0YXRpYyB2b2lkIGlt
c2ljX3ZzZmlsZV9sb2NhbF91cGRhdGUoaW50IHZzZmlsZV9oZ2VpLCB1MzIgbnJfZWl4LAo+ICAg
ICAgICAgY3NyX3dyaXRlKENTUl9WU0lTRUxFQ1QsIG9sZF92c2lzZWxlY3QpOwo+ICB9Cj4KPiAr
c3RhdGljIHZvaWQgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKHN0cnVjdCBpbXNpYyAqaW1zaWMsIGlu
dCBjcHUsIGludCBoZ2VpKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsK
PiArICAgICAgIC8qIFNlcmlhbGl6ZSB0aGUgQ1BVL0hHRUkgcGFpciB3aXRoIHNjaGVkdWxlci1v
dXQncyB3YWtldXAgc2V0dXAuICovCj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlt
c2ljLT5oZ2VpX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIGltc2ljLT52c2ZpbGVfY3B1ID0gY3B1
Owo+ICsgICAgICAgaW1zaWMtPnZzZmlsZV9oZ2VpID0gaGdlaTsKPiArICAgICAgIHJhd19zcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+aGdlaV9sb2NrLCBmbGFncyk7Cj4gK30KPiArCj4g
IHN0YXRpYyB2b2lkIGltc2ljX3ZzZmlsZV9jbGVhbnVwKHN0cnVjdCBpbXNpYyAqaW1zaWMpCj4g
IHsKPiAgICAgICAgIGludCBvbGRfdnNmaWxlX2hnZWksIG9sZF92c2ZpbGVfY3B1Owo+IEBAIC01
OTYsNyArNjA5LDcgQEAgc3RhdGljIHZvaWQgaW1zaWNfdnNmaWxlX2NsZWFudXAoc3RydWN0IGlt
c2ljICppbXNpYykKPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9s
b2NrLCBmbGFncyk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNpYy0+dnNmaWxlX2hn
ZWk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2NwdSA9IGltc2ljLT52c2ZpbGVfY3B1Owo+IC0gICAg
ICAgaW1zaWMtPnZzZmlsZV9jcHUgPSBpbXNpYy0+dnNmaWxlX2hnZWkgPSAtMTsKPiArICAgICAg
IGltc2ljX3ZzZmlsZV9zZXRfaGdlaShpbXNpYywgLTEsIC0xKTsKPiAgICAgICAgIGltc2ljLT52
c2ZpbGVfdmEgPSBOVUxMOwo+ICAgICAgICAgaW1zaWMtPnZzZmlsZV9wYSA9IDA7Cj4gICAgICAg
ICB3cml0ZV91bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4g
QEAgLTcyNywxMCArNzQwLDEwIEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICBpZiAoIWt2bV92Y3B1X2lzX2Jsb2NraW5n
KHZjcHUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIHJlYWRfbG9ja19p
cnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIHJhd19zcGluX2xv
Y2tfaXJxc2F2ZSgmaW1zaWMtPmhnZWlfbG9jaywgZmxhZ3MpOwo+ICAgICAgICAgaWYgKGltc2lj
LT52c2ZpbGVfY3B1ID4gLTEpCj4gICAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX0hHRUlFLCBC
SVQoaW1zaWMtPnZzZmlsZV9oZ2VpKSk7Cj4gLSAgICAgICByZWFkX3VubG9ja19pcnFyZXN0b3Jl
KCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiArICAgICAgIHJhd19zcGluX3VubG9ja19p
cnFyZXN0b3JlKCZpbXNpYy0+aGdlaV9sb2NrLCBmbGFncyk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9y
aXNjdl92Y3B1X2FpYV9pbXNpY19yZWxlYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiBAQCAt
NzQ3LDcgKzc2MCw3IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3JlbGVhc2Uoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgd3JpdGVfbG9ja19pcnFzYXZlKCZpbXNpYy0+
dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIG9sZF92c2ZpbGVfaGdlaSA9IGltc2ljLT52
c2ZpbGVfaGdlaTsKPiAgICAgICAgIG9sZF92c2ZpbGVfY3B1ID0gaW1zaWMtPnZzZmlsZV9jcHU7
Cj4gLSAgICAgICBpbXNpYy0+dnNmaWxlX2NwdSA9IGltc2ljLT52c2ZpbGVfaGdlaSA9IC0xOwo+
ICsgICAgICAgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKGltc2ljLCAtMSwgLTEpOwo+ICAgICAgICAg
aW1zaWMtPnZzZmlsZV92YSA9IE5VTEw7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX3BhID0gMDsK
PiAgICAgICAgIHdyaXRlX3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZs
YWdzKTsKPiBAQCAtODYxLDggKzg3NCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNf
dXBkYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgLyogVXBkYXRlIG5ldyBJ
TVNJQyBWUy1maWxlIGRldGFpbHMgaW4gSU1TSUMgY29udGV4dCAqLwo+ICAgICAgICAgd3JpdGVf
bG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIGltc2lj
LT52c2ZpbGVfaGdlaSA9IG5ld192c2ZpbGVfaGdlaTsKPiAtICAgICAgIGltc2ljLT52c2ZpbGVf
Y3B1ID0gdmNwdS0+Y3B1Owo+ICsgICAgICAgaW1zaWNfdnNmaWxlX3NldF9oZ2VpKGltc2ljLCB2
Y3B1LT5jcHUsIG5ld192c2ZpbGVfaGdlaSk7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX3ZhID0g
bmV3X3ZzZmlsZV92YTsKPiAgICAgICAgIGltc2ljLT52c2ZpbGVfcGEgPSBuZXdfdnNmaWxlX3Bh
Owo+ICAgICAgICAgd3JpdGVfdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywg
ZmxhZ3MpOwo+IEBAIC0xMTEyLDYgKzExMjQsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2lt
c2ljX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgLyogU2V0dXAgSU1TSUMg
Y29udGV4dCAgKi8KPiAgICAgICAgIGltc2ljLT5ucl9tc2lzID0ga3ZtLT5hcmNoLmFpYS5ucl9p
ZHMgKyAxOwo+ICAgICAgICAgcndsb2NrX2luaXQoJmltc2ljLT52c2ZpbGVfbG9jayk7Cj4gKyAg
ICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmltc2ljLT5oZ2VpX2xvY2spOwo+ICAgICAgICAgaW1z
aWMtPm5yX2VpeCA9IEJJVFNfVE9fVTY0KGltc2ljLT5ucl9tc2lzKTsKPiAgICAgICAgIGltc2lj
LT5ucl9od19laXggPSBCSVRTX1RPX1U2NChrdm1fcmlzY3ZfYWlhX21heF9pZHMpOwo+ICAgICAg
ICAgaW1zaWMtPnZzZmlsZV9oZ2VpID0gaW1zaWMtPnZzZmlsZV9jcHUgPSAtMTsKPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
