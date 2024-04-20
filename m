Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF86EC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yom6iGg8ebmCj1HGuQNI0HbSz2aiXmAn/T/w+EhdmM=; b=FlW34B/BuOScEu
	KiDVQ6yw5SjqnnqqlifSW0wKAgaJLjSXLlY+3bUe+8w80bKfv2Dz1vXjhN6cBJZ9McuYlxpkwa33R
	OY86Y89XRvmqswS55Xg5iylyPqGJKI2UXc/utkapCyFPBmMdiSWAd2xWr29G/b4R+xhBj3GuCmtmN
	1bbhGhpx66CNTtnohvvbUNv26fORMZiy4uR38jox9Kb8DWCtEblPXC2W1L3pfTvbGNQrazX7zjTtl
	unx8pX+3qRkhWgz0iMWHqPPKGi15L/XuT0a83GQuGfEQCzoJuzQ7EbxlptErOSjLONtpL/ULkvtAV
	co2buYv4EuLpR99Nx8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzDV-00000007TUG-1NNT;
	Sat, 20 Apr 2024 01:08:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzDS-00000007TSg-00lu
	for linux-riscv@lists.infradead.org;
	Sat, 20 Apr 2024 01:08:32 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so3396761e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 18:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713575304; x=1714180104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FopOoJVqlKLyitM+vV+llThPHlvMlGI12SmtWJmmk/0=;
        b=vYcJDAGTfhKxKI2QPRbi2x2W21Uvq5z0yBQhU3NkTnXswymviXB2V1+YHoOTlhZeJi
         VQa1CdvloWjmH3qtgCEBL8wa+OYdF3XwwDYVMwyZz8dDNvLnC/gtVcH8SflAbOlQtfRv
         lm4UiuDsWLeUxmYoeu6WzSLReuXgQn5hLNkcCr+2MkDFwT6sVyBLtdgM7dyh7wrkG/kg
         He/BbijMQKsIaHbNYUss629QtfuT/nur4SpsvrnmGvwEWTL4kCbJn8T6D7UxX3wyvdir
         mQsUJgryi1KijdGlmSv0E/TR/Pi+y1bco+plYF/tnSoFK7QKN4DnY+6YQIpo3my2wQKX
         yNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713575304; x=1714180104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FopOoJVqlKLyitM+vV+llThPHlvMlGI12SmtWJmmk/0=;
        b=czIuzpEeRcfYNbgBsQnR5MjCr52UVC5j1aO00jXyBkzmYoTby+1fO7R4rMwvMvHU9N
         3IALaxSw5srwF4cI2TKGlIcgJ3LY1hoYuQANIyRbSmdm36F6hjmf0VE2Wcxo4+Om1xR+
         KW/KDwD8GqApIHx4xQF+mURZbVcxKjAm+HNY55f6vQ7GdhUxfSdIjxrnDylZcp2I0khJ
         H83nzEmid9OZqEvxLYWPpF0h1f16OZzfBQlPRBNZAaODjEtwNM/RehQIuUjZEL0GOH9n
         f41N/wIBOxUNLQMwBdvyVaZ+X95j/iKN3V2Fk9lnmTL7fRACLfTcZPP0yx2fxWGk3Fcw
         eseQ==
X-Forwarded-Encrypted: i=1; AJvYcCUicoTKhUwxQcKomcpqOEiqzQPUn6Wk06zAMqz0vCcHBe0ZXEAqy29L8IA1MGyd/Q4IsxD0X4ydMLazErzoTJDxhC4PSgpnOViATwM5d9kR
X-Gm-Message-State: AOJu0YwGsixOZ+iUXCcg0MLVO8ox/sF1ey7K7YXs/w/rPy/JdVtek3iT
	vcY4G1PHk+f/fVoWSsw34KD89N7KXxbAWdkCYRUlhR8oYe33bXV+iqpcMKgY+Ab9z3W6zpIMJmI
	Xdh1ME4eGXjbgEzy1siD6zS691ils55r3UwnFKQ==
X-Google-Smtp-Source: AGHT+IEogPfnlgAs9tR0qh0PAukDsFCglg4IjcLIKZzaVYr+8YdRMjPXcvRvV/A0KI3X5O1GyN/90pSnjyS/BTYsdl8=
X-Received: by 2002:ac2:5a1e:0:b0:519:296e:2c80 with SMTP id
 q30-20020ac25a1e000000b00519296e2c80mr1893557lfn.15.1713575303793; Fri, 19
 Apr 2024 18:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-9-atishp@rivosinc.com>
 <6fa06233-d572-48a7-a8ef-73a7c5879c06@sifive.com>
In-Reply-To: <6fa06233-d572-48a7-a8ef-73a7c5879c06@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 19 Apr 2024 18:08:12 -0700
Message-ID: <CAHBxVyHZ81G7yaMkV25RBwS=ric=MA92MePaPtQaOXuR+C70YA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] drivers/perf: riscv: Fix counter mask iteration
 for RV32
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_180830_191492_EEFC7FAD 
X-CRM114-Status: GOOD (  21.83  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgNTozN+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEF0aXNoLAo+Cj4gT24gMjAyNC0wNC0y
MCAxMDoxNyBBTSwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiBGb3IgUlYzMiwgdXNlZF9od19jdHJz
IGNhbiBoYXZlIG1vcmUgdGhhbiAxIHdvcmQgaWYgdGhlIGZpcm13YXJlIGNob29zZXMKPiA+IHRv
IGludGVybGVhdmUgZmlybXdhcmUvaGFyZHdhcmUgY291bnRlcnMgaW5kaWNpZXMuIEV2ZW4gdGhv
dWdoIGl0J3MgYQo+ID4gdW5saWtlbHkgc2NlbmFyaW8sIGhhbmRsZSB0aGF0IGNhc2UgYnkgaXRl
cmF0aW5nIG92ZXIgYWxsIHRoZSB3b3Jkcwo+ID4gaW5zdGVhZCBvZiBqdXN0IHVzaW5nIHRoZSBm
aXJzdCB3b3JkLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMjEg
KysrKysrKysrKysrLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBpbmRleCBmMjM1
MDE4OTg2NTcuLjRlYWNkODkxNDFhOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMKPiA+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IEBA
IC02NTIsMTAgKzY1MiwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcG11X3NiaV9zdG9wX2FsbChz
dHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIHBtdV9zYmlfc3Rv
cF9od19jdHJzKHN0cnVjdCByaXNjdl9wbXUgKnBtdSkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3Qg
Y3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCA9IHRoaXNfY3B1X3B0cihwbXUtPmh3X2V2ZW50cyk7
Cj4gPiArICAgICBpbnQgaTsKPiA+Cj4gPiAtICAgICAvKiBObyBuZWVkIHRvIGNoZWNrIHRoZSBl
cnJvciBoZXJlIGFzIHdlIGNhbid0IGRvIGFueXRoaW5nIGFib3V0IHRoZSBlcnJvciAqLwo+ID4g
LSAgICAgc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9DT1VOVEVSX1NUT1AsIDAs
Cj4gPiAtICAgICAgICAgICAgICAgY3B1X2h3X2V2dC0+dXNlZF9od19jdHJzWzBdLCAwLCAwLCAw
LCAwKTsKPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBCSVRTX1RPX0xPTkdTKFJJU0NWX01BWF9D
T1VOVEVSUyk7IGkrKykKPiA+ICsgICAgICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB0aGUg
ZXJyb3IgaGVyZSBhcyB3ZSBjYW4ndCBkbyBhbnl0aGluZyBhYm91dCB0aGUgZXJyb3IgKi8KPiA+
ICsgICAgICAgICAgICAgc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9DT1VOVEVS
X1NUT1AsIGkgKiBCSVRTX1BFUl9MT05HLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1
X2h3X2V2dC0+dXNlZF9od19jdHJzW2ldLCAwLCAwLCAwLCAwKTsKPiA+ICB9Cj4gPgo+ID4gIC8q
Cj4gPiBAQCAtNjY3LDcgKzY2OSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwbXVfc2JpX3N0b3Bf
aHdfY3RycyhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIHBt
dV9zYmlfc3RhcnRfb3ZlcmZsb3dfbWFzayhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGN0
cl9vdmZfbWFzaykKPiA+ICB7Cj4gPiAtICAgICBpbnQgaWR4ID0gMDsKPiA+ICsgICAgIGludCBp
ZHggPSAwLCBpOwo+ID4gICAgICAgc3RydWN0IGNwdV9od19ldmVudHMgKmNwdV9od19ldnQgPSB0
aGlzX2NwdV9wdHIocG11LT5od19ldmVudHMpOwo+ID4gICAgICAgc3RydWN0IHBlcmZfZXZlbnQg
KmV2ZW50Owo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnID0gU0JJX1BNVV9TVEFSVF9GTEFH
X1NFVF9JTklUX1ZBTFVFOwo+ID4gQEAgLTY3NiwxMSArNjc4LDEyIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBwbXVfc2JpX3N0YXJ0X292ZXJmbG93X21hc2soc3RydWN0IHJpc2N2X3BtdSAqcG11LAo+
ID4gICAgICAgc3RydWN0IGh3X3BlcmZfZXZlbnQgKmh3YzsKPiA+ICAgICAgIHU2NCBpbml0X3Zh
bCA9IDA7Cj4gPgo+ID4gLSAgICAgY3RyX3N0YXJ0X21hc2sgPSBjcHVfaHdfZXZ0LT51c2VkX2h3
X2N0cnNbMF0gJiB+Y3RyX292Zl9tYXNrOwo+ID4gLQo+ID4gLSAgICAgLyogU3RhcnQgYWxsIHRo
ZSBjb3VudGVycyB0aGF0IGRpZCBub3Qgb3ZlcmZsb3cgaW4gYSBzaW5nbGUgc2hvdCAqLwo+ID4g
LSAgICAgc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9DT1VOVEVSX1NUQVJULCAw
LCBjdHJfc3RhcnRfbWFzaywKPiA+IC0gICAgICAgICAgICAgICAwLCAwLCAwLCAwKTsKPiA+ICsg
ICAgIGZvciAoaSA9IDA7IGkgPCBCSVRTX1RPX0xPTkdTKFJJU0NWX01BWF9DT1VOVEVSUyk7IGkr
Kykgewo+ID4gKyAgICAgICAgICAgICBjdHJfc3RhcnRfbWFzayA9IGNwdV9od19ldnQtPnVzZWRf
aHdfY3Ryc1tpXSAmIH5jdHJfb3ZmX21hc2s7Cj4KPiBUaGlzIGlzIGFwcGx5aW5nIHRoZSBtYXNr
IGZvciB0aGUgZmlyc3QgMzIgbG9naWNhbCBjb3VudGVycyB0byB0aGUgYm90aCBzZXRzIG9mCj4g
MzIgbG9naWNhbCBjb3VudGVycy4gY3RyX292Zl9tYXNrIG5lZWRzIHRvIGJlIDY0IGJpdHMgd2lk
ZSBoZXJlLCBzbyBlYWNoIGxvb3AKPiBpdGVyYXRpb24gY2FuIGFwcGx5IHRoZSBjb3JyZWN0IGhh
bGYgb2YgdGhlIG1hc2suCj4KClRoZSA2NGJpdCB3aWRlIHN1cHBvcnQgZm9yIGN0cl9vdmZfbWFz
ayBpcyBhZGRlZCBpbiB0aGUgbmV4dCBwYXRjaC4KCj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4g
KyAgICAgICAgICAgICAvKiBTdGFydCBhbGwgdGhlIGNvdW50ZXJzIHRoYXQgZGlkIG5vdCBvdmVy
ZmxvdyBpbiBhIHNpbmdsZSBzaG90ICovCj4gPiArICAgICAgICAgICAgIHNiaV9lY2FsbChTQklf
RVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9TVEFSVCwgaSAqIEJJVFNfUEVSX0xPTkcsIGN0
cl9zdGFydF9tYXNrLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDAsIDApOwo+ID4g
KyAgICAgfQo+ID4KPiA+ICAgICAgIC8qIFJlaW5pdGlhbGl6ZSBhbmQgc3RhcnQgYWxsIHRoZSBj
b3VudGVyIHRoYXQgb3ZlcmZsb3dlZCAqLwo+ID4gICAgICAgd2hpbGUgKGN0cl9vdmZfbWFzaykg
ewo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
