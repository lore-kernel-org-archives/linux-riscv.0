Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3E0C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExzUbqubU4LVGCuSnHEMCcIleC4yDpEulDDMOXlkcWY=; b=lBaIuhW8AKRtrr
	EM++EFdw8ZLjh3sAVkYEpnBtJ7hc+lxQcs6rliBEDLlwO5GBRfY5kYT1+GBM7ewvYOgnFe1ihgVmy
	4jwpK+V67bKsii7sZGnb08oefZ1/mxQFmxwKw8eo0Yb7lWUgPylFq+16ljZwaYx1b8DRWnWqNFky5
	3Z4Gm98kM3u9zfk/uuhMvz6IKegEBGWkj5qMIY3GyaRriWbIEEl8pN6qI33SGQ89XbkPGv+PQdzUO
	ALC9JvUyXHK6Gl9AbLNeuhlmkxLs5W+2zoDtSY641jEaUDOZjbgSEXEZAKdfb8gZfVbItFtVtN2Z4
	j1Dv7GzzmR99hdZBnVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJh3-000000040a9-1yJS;
	Tue, 09 Apr 2024 22:11:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruJgz-000000040Yu-45WL
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 22:11:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516dc51bb72so4448522e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712700707; x=1713305507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl1aEg9ZkKTDAHIndPvHsR0jY5Vb252ppSopDvYPPc0=;
        b=jnc5DhoeLu+O8kulbZoiGozrFEgmK8TwcD8YQpYGwPyu/393HlYOPT/5gk1BC6cZfy
         BLY2ICHs/s5XFzYhH0+qVJZF02RI4BGitDbIiF4XvL13LZjuJSBgqQli52ORsJEne5no
         quQDb08WUktzkAMFM/FEPNlpNrpwiYf07ePwtviVA+jvhkp1CtGL9xSTmUhDqzjn7Vg5
         TXxYxulsK6HKCZLO6UqmF9j39HBGDUJLFkSno4mcUY7KntLRYVfNPeifWI1iYmPauDE3
         EmGbm43mbH0iwcg2XtJOSiNM8IECBc5gegKoqyQei0VnVTFKI/x6bL9TCvViKsX56K3E
         rqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712700707; x=1713305507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl1aEg9ZkKTDAHIndPvHsR0jY5Vb252ppSopDvYPPc0=;
        b=f4ucqaijSqxHNV7iqsmOPqQ04/rxDDhvce5upZMMFDYPB3lBr1E1IGL3wY59FEihUj
         cL+9cLb9G9GDMeuc8gdqU8+BNytWcIROXZ9mb7cUTOkmoLpEKljOQ4qv0saR3T4D+vYV
         /tfYGBFni5Ozk2t7A0XES6KEgNvReb5ClZiQ0jWohp0cP5aM+rhcXXRrcaQ4J4Rxe+6p
         k9t38xwer83KpQldwWkNXTnBnrj2gzc58DltULnvPgy+PEG9m+0cyvnrjxEMy1yjgS/5
         4YRu0UXWyVhEHl9ra+/WaQHTvwKl2UfOFbyllIX3QlLrGf6qfWUUVXnBFO4iizRMU8Vl
         XdHw==
X-Forwarded-Encrypted: i=1; AJvYcCWiBj2GrhUGjm0/arh+bcX8PIH9a6nJXLLuJM6gv72+hTUXK7kJTSh4mGNveWI1w04olBHoc2mwOKIb46C5xiOtBSbHUX54QA5hxNWaRzhK
X-Gm-Message-State: AOJu0YxvNvcn5o4/j7c+4Z5Y7XmIN4aLpErVcdRN56tKHj7UZjD+6pE0
	XjRncMIDDpbsFqi+7NhMygVKExd1LAx6vgznTTsNFJXLjouwCh6b4emlQGW8UV4i7h/7X4ToW3z
	8gpdFf2Rpi0ElLkY2T0m2Xc65WyRN2JoKdrywcg==
X-Google-Smtp-Source: AGHT+IFTUPK3REgvGdMgOwGApDJXWXHwEqfkXjMrnKsgvS0JKy+X2AS1/dTWFN/mLB8J3aVxZ0Rh0sVUHLgSm3wYrPg=
X-Received: by 2002:a19:f70b:0:b0:513:b90f:f4dd with SMTP id
 z11-20020a19f70b000000b00513b90ff4ddmr352775lfe.49.1712700707477; Tue, 09 Apr
 2024 15:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240403080452.1007601-1-atishp@rivosinc.com> <20240403080452.1007601-21-atishp@rivosinc.com>
 <20240405-d1a4cb9a441a05a9d2f8b1c8@orel> <976411ab-6ddf-4b10-8e13-1575928415ce@rivosinc.com>
 <20240409-dd055c3d08e027cf2a5cb4dc@orel>
In-Reply-To: <20240409-dd055c3d08e027cf2a5cb4dc@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 9 Apr 2024 15:11:36 -0700
Message-ID: <CAHBxVyEh0K5b0SdN-asrOuuggBztZ-mjCoOR=EC067pURRg3aA@mail.gmail.com>
Subject: Re: [PATCH v5 20/22] KVM: riscv: selftests: Add SBI PMU selftest
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_151150_129482_9C6C6494 
X-CRM114-Status: GOOD (  32.87  )
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

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCAxOjAx4oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAwOCwgMjAyNCBhdCAwNTozNzox
OVBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IE9uIDQvNS8yNCAwNTo1MCwgQW5kcmV3
IEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEFwciAwMywgMjAyNCBhdCAwMTowNDo0OUFNIC0w
NzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+ID4gLi4uCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHRl
c3RfcG11X2Jhc2ljX3Nhbml0eSh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyBsb25nIG91dF92
YWwgPSAwOwo+ID4gPiA+ICsgYm9vbCBwcm9iZTsKPiA+ID4gPiArIHN0cnVjdCBzYmlyZXQgcmV0
Owo+ID4gPiA+ICsgaW50IG51bV9jb3VudGVycyA9IDAsIGk7Cj4gPiA+ID4gKyB1bmlvbiBzYmlf
cG11X2N0cl9pbmZvIGN0cmluZm87Cj4gPiA+ID4gKwo+ID4gPiA+ICsgcHJvYmUgPSBndWVzdF9z
YmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfUE1VLCAmb3V0X3ZhbCk7Cj4gPiA+ID4gKyBHVUVT
VF9BU1NFUlQocHJvYmUgJiYgb3V0X3ZhbCA9PSAxKTsKPiA+ID4gPiArCj4gPiA+ID4gKyBudW1f
Y291bnRlcnMgPSBnZXRfbnVtX2NvdW50ZXJzKCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgZm9yIChp
ID0gMDsgaSA8IG51bV9jb3VudGVyczsgaSsrKSB7Cj4gPiA+ID4gKyAgICAgICAgIHJldCA9IHNi
aV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9HRVRfSU5GTywgaSwKPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDAsIDAsIDApOwo+ID4gPiA+ICsK
PiA+ID4gPiArICAgICAgICAgLyogVGhlcmUgY2FuIGJlIGdhcHMgaW4gbG9naWNhbCBjb3VudGVy
IGluZGljaWVzKi8KPiA+ID4gPiArICAgICAgICAgaWYgKHJldC5lcnJvcikKPiA+ID4gPiArICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiArICAgICAgICAgR1VFU1RfQVNTRVJUX05F
KHJldC52YWx1ZSwgMCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICBjdHJpbmZvLnZhbHVl
ID0gcmV0LnZhbHVlOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgLyoqCj4gPiA+ID4gKyAg
ICAgICAgICAqIEFjY2VzaWJpbGxpdHkgY2hlY2sgb2YgaGFyZHdhcmUgYW5kIHJlYWQgY2FwYWJp
bGl0eSBvZiBmaXJtd2FyZSBjb3VudGVycy4KPiA+ID4KPiA+ID4gQWNjZXNzaWJpbGl0eQo+ID4g
Pgo+ID4KPiA+IEZpeGVkIGl0Lgo+ID4KPiA+ID4gPiArICAgICAgICAgICogVGhlIHNwZWMgZG9l
c24ndCBtYW5kYXRlIGFueSBpbml0aWFsIHZhbHVlLiBObyBuZWVkIHRvIGNoZWNrIGFueSB2YWx1
ZS4KPiA+ID4gPiArICAgICAgICAgICovCj4gPiA+ID4gKyAgICAgICAgIHJlYWRfY291bnRlcihp
LCBjdHJpbmZvKTsKPiA+ID4gPiArIH0KPiA+ID4gPiArCj4gPiA+ID4gKyBHVUVTVF9ET05FKCk7
Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHJ1bl92Y3B1KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiA+ID4gPiArewo+ID4gPiA+ICsgc3RydWN0IHVjYWxsIHVjOwo+
ID4gPiA+ICsKPiA+ID4gPiArIHZjcHVfcnVuKHZjcHUpOwo+ID4gPiA+ICsgc3dpdGNoIChnZXRf
dWNhbGwodmNwdSwgJnVjKSkgewo+ID4gPiA+ICsgY2FzZSBVQ0FMTF9BQk9SVDoKPiA+ID4gPiAr
ICAgICAgICAgUkVQT1JUX0dVRVNUX0FTU0VSVCh1Yyk7Cj4gPiA+ID4gKyAgICAgICAgIGJyZWFr
Owo+ID4gPiA+ICsgY2FzZSBVQ0FMTF9ET05FOgo+ID4gPiA+ICsgY2FzZSBVQ0FMTF9TWU5DOgo+
ID4gPiA+ICsgICAgICAgICBicmVhazsKPiA+ID4gPiArIGRlZmF1bHQ6Cj4gPiA+ID4gKyAgICAg
ICAgIFRFU1RfRkFJTCgiVW5rbm93biB1Y2FsbCAlbHUiLCB1Yy5jbWQpOwo+ID4gPiA+ICsgICAg
ICAgICBicmVhazsKPiA+ID4gPiArIH0KPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArdm9p
ZCB0ZXN0X3ZtX2Rlc3Ryb3koc3RydWN0IGt2bV92bSAqdm0pCj4gPiA+ID4gK3sKPiA+ID4gPiAr
IG1lbXNldChjdHJpbmZvX2FyciwgMCwgc2l6ZW9mKHVuaW9uIHNiaV9wbXVfY3RyX2luZm8pICog
UklTQ1ZfTUFYX1BNVV9DT1VOVEVSUyk7Cj4gPiA+ID4gKyBjb3VudGVyX21hc2tfYXZhaWxhYmxl
ID0gMDsKPiA+ID4gPiArIGt2bV92bV9mcmVlKHZtKTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+
ID4gPiArc3RhdGljIHZvaWQgdGVzdF92bV9iYXNpY190ZXN0KHZvaWQgKmd1ZXN0X2NvZGUpCj4g
PiA+ID4gK3sKPiA+ID4gPiArIHN0cnVjdCBrdm1fdm0gKnZtOwo+ID4gPiA+ICsgc3RydWN0IGt2
bV92Y3B1ICp2Y3B1Owo+ID4gPiA+ICsKPiA+ID4gPiArIHZtID0gdm1fY3JlYXRlX3dpdGhfb25l
X3ZjcHUoJnZjcHUsIGd1ZXN0X2NvZGUpOwo+ID4gPiA+ICsgX19URVNUX1JFUVVJUkUoX192Y3B1
X2hhc19zYmlfZXh0KHZjcHUsIEtWTV9SSVNDVl9TQklfRVhUX1BNVSksCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiU0JJIFBNVSBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0
ZXN0Iik7Cj4gPiA+ID4gKyB2bV9pbml0X3ZlY3Rvcl90YWJsZXModm0pOwo+ID4gPiA+ICsgLyog
SWxsZWdhbCBpbnN0cnVjdGlvbiBoYW5kbGVyIGlzIHJlcXVpcmVkIHRvIHZlcmlmeSByZWFkIGFj
Y2VzcyB3aXRob3V0IGNvbmZpZ3VyYXRpb24gKi8KPiA+ID4gPiArIHZtX2luc3RhbGxfZXhjZXB0
aW9uX2hhbmRsZXIodm0sIEVYQ19JTlNUX0lMTEVHQUwsIGd1ZXN0X2lsbGVnYWxfZXhjZXB0aW9u
X2hhbmRsZXIpOwo+ID4gPgo+ID4gPiBJIHN0aWxsIGRvbid0IHNlZSB3aGVyZSB0aGUgInZlcmlm
eSIgcGFydCBpcy4gVGhlIGhhbmRsZXIgZG9lc24ndCByZWNvcmQKPiA+ID4gdGhhdCBpdCBoYWQg
dG8gaGFuZGxlIGFueXRoaW5nLgo+ID4gPgo+ID4KPiA+IFRoZSBvYmplY3RpdmUgb2YgdGhlIHRl
c3QgaXMgdG8gZW5zdXJlIHRoYXQgd2UgZ2V0IGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24KPiA+IHdp
dGhvdXQgY29uZmlndXJhdGlvbi4KPgo+IFRoaXMgcGFydCBJIGd1ZXNzZWQuCj4KPiA+IFRoZSBw
cmVzZW5jZSBvZiB0aGUgcmVnaXN0ZXJlZCBleGNlcHRpb24gaGFuZGxlciBpcwo+ID4gc3VmZmlj
aWVudCBmb3IgdGhhdC4KPgo+IFRoaXMgcGFydCBJIGRpc2FncmVlIHdpdGguIFRoZSBoYW5kbGVy
IG1heSBub3QgYmUgbmVjZXNzYXJ5IGFuZCBub3QgcnVuIGlmCj4gd2UgZG9uJ3QgZ2V0IHRoZSBJ
TEwuIFVzdWFsbHkgd2hlbiBJIHdyaXRlIHRlc3RzIGxpa2UgdGhlc2UgSSBzZXQgYQo+IGJvb2xl
YW4gaW4gdGhlIGhhbmRsZXIgYW5kIGNoZWNrIGl0IGFmdGVyIHRoZSBpbnN0cnVjdGlvbiB3aGlj
aCBzaG91bGQKPiBoYXZlIHNlbnQgdXMgdGhlcmUgdG8gbWFrZSBzdXJlIHdlIGRpZCBpbmRlZWQg
Z28gdGhlcmUuCj4KCkFoaCBJIGdvdCB5b3VyIHBvaW50IG5vdy4gVGhhdCBtYWtlcyBzZW5zZS4g
U2luY2UgaXQgd2FzIGp1c3QgYSBzYW5pdHkgdGVzdCwKSSBoYWRuJ3QgcHV0IHRoZSBib29sZWFu
IGNoZWNrIGVhcmxpZXIuIEJ1dCB5b3UgYXJlIGNvcnJlY3QgYWJvdXQgYnVncwppbiBrdm0gY29k
ZSB3aGljaCB3b3VsZG4ndApnZW5lcmF0ZSBhbiBleHBlY3RlZCBJTEwgLgoKSSBoYXZlIGFkZGVk
IGl0LiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIDopCgo+ID4KPiA+IFRoZSB2ZXJpZnkgcGFy
dCBpcyB0aGF0IHRoZSB0ZXN0IGRvZXNuJ3QgZW5kIHVwIGluIGEgaWxsZWdhbCBpbnN0cnVjdGlv
bgo+ID4gZXhjZXB0aW9uIHdoZW4geW91IHRyeSB0byBhY2Nlc3MgYSBjb3VudGVyIHdpdGhvdXQg
Y29uZmlndXJpbmcuCj4gPgo+ID4gTGV0IG1lIGtub3cgaWYgeW91IHRoaW5rIHdlIHNob3VsZCBt
b3JlIHZlcmJvc2UgY29tbWVudCB0byBleHBsYWluIHRoZQo+ID4gc2NlbmFyaW8uCj4gPgo+Cj4g
V2l0aCBhIGJvb2xlYW4gdGhlIHRlc3QgY29kZSB3aWxsIGJlIG1vc3RseSBzZWxmIGRvY3VtZW50
aW5nLCBidXQgYSBzaG9ydAo+IGNvbW1lbnQgc2F5aW5nIHdoeSB3ZSBleHBlY3QgdGhlIGJvb2xl
YW4gdG8gYmUgc2V0IHdvdWxkIGJlIGdvb2QgdG9vLgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+ID4K
PiA+ID4gPiArCj4gPiA+ID4gKyB2Y3B1X2luaXRfdmVjdG9yX3RhYmxlcyh2Y3B1KTsKPiA+ID4g
PiArIHJ1bl92Y3B1KHZjcHUpOwo+ID4gPiA+ICsKPiA+ID4gPiArIHRlc3Rfdm1fZGVzdHJveSh2
bSk7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHRlc3Rfdm1fZXZl
bnRzX3Rlc3Qodm9pZCAqZ3Vlc3RfY29kZSkKPiA+ID4gPiArewo+ID4gPiA+ICsgc3RydWN0IGt2
bV92bSAqdm0gPSBOVUxMOwo+ID4gPiA+ICsgc3RydWN0IGt2bV92Y3B1ICp2Y3B1ID0gTlVMTDsK
PiA+ID4gPiArCj4gPiA+ID4gKyB2bSA9IHZtX2NyZWF0ZV93aXRoX29uZV92Y3B1KCZ2Y3B1LCBn
dWVzdF9jb2RlKTsKPiA+ID4gPiArIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9oYXNfc2JpX2V4dCh2
Y3B1LCBLVk1fUklTQ1ZfU0JJX0VYVF9QTVUpLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIlNCSSBQTVUgbm90IGF2YWlsYWJsZSwgc2tpcHBpbmcgdGVzdCIpOwo+ID4gPiA+
ICsgcnVuX3ZjcHUodmNwdSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgdGVzdF92bV9kZXN0cm95KHZt
KTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiAraW50IG1haW4odm9pZCkKPiA+ID4gPiAr
ewo+ID4gPiA+ICsgdGVzdF92bV9iYXNpY190ZXN0KHRlc3RfcG11X2Jhc2ljX3Nhbml0eSk7Cj4g
PiA+ID4gKyBwcl9pbmZvKCJTQkkgUE1VIGJhc2ljIHRlc3QgOiBQQVNTXG4iKTsKPiA+ID4gPiAr
Cj4gPiA+ID4gKyB0ZXN0X3ZtX2V2ZW50c190ZXN0KHRlc3RfcG11X2V2ZW50cyk7Cj4gPiA+ID4g
KyBwcl9pbmZvKCJTQkkgUE1VIGV2ZW50IHZlcmlmaWNhdGlvbiB0ZXN0IDogUEFTU1xuIik7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiAtLQo+ID4gPiA+
IDIuMzQuMQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gZHJldwo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
