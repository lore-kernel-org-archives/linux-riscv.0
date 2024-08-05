Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B8C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nh/rW8zNJFbWgaao+ZLbX7fjKqfMmlrgH3AkZ0ZOe8Q=; b=ZaBcFDq7lDmszV
	bMRsu3AyPlDBZEwdyveV2ZAZjvc0rOalr1t2tefDB0Q4YD72ZPvXsLQHIwaWYXAFjMd5pnU9PfvDM
	UCbglO2OucoPPqTp2XMsXsG5ci1bpJGP3+gyCzwRHGAPoXckW721fqVD1O5cmz0tHCP4JJlhFDr8B
	/U18FgL5sdsxawwQP/K/j5qv7L79/qww+ozK4yRceibApVvXU+S21UOp8bgMmTMXzFpJJRxbghR7/
	duAmFStNtyIOwt/HeA+dt/A6qrphDwAr62w6yXZvjUnM79LNnfH+PTj0BMjxTOsX9EJ1ZGnnoMtqi
	K0J3d+OVR1rMRVevfbEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2sv-0000000Gvyo-0H4U;
	Mon, 05 Aug 2024 18:56:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb2ss-0000000Gvy9-0KYI
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 18:56:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so1002968566b.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722884200; x=1723489000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUCe9t3DbMdvdQ1nzM8zE6iXIiJ0GPq3M/3OVa2FyV4=;
        b=i5rrVuGwjcFZ5ukPQSpVQd8nofh7PA9//SUOYYrMEE74x9lLU+CG5PoDqwaV8WtvmB
         KneC6VoRPbdsxrcdYRd8qnrMGTSBup0Jy3To2iPbT1ukbX4HzMxFDg28ICRIIFUvIvbE
         d+rfQcm0j6B+FaSgb7fiMdvaLW3qMNREFzOSIyd92PuKMG0NTf5sxMxxD0AN5amUpGjD
         7leac+8USed+Z9fWyaeC3CPevkfOqFnGJTkcVn9b5QfU+anYTb2vhVfHltJB148DH/5D
         nIguNeVSxaSt9RUoUerv3HrM9CNKTjVu/lemdWf7MtPozc3+v0ucmIIaEhuSx9cj/Z2f
         251Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722884200; x=1723489000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUCe9t3DbMdvdQ1nzM8zE6iXIiJ0GPq3M/3OVa2FyV4=;
        b=mKbM4kGeBVcGsWH7JjleA+8ly0Jscs3WZJFaTrysIVUOLGub4KxkaaQZuWuaOvcEcP
         WtlszftUuqeGTBVZHcyZrQRP5gmVKNgeFNfYmDfERdmcnZTp/9heMFX9nWeGtncYnU92
         9jABdsZdc/Rlm0KGucm2lmVNJbp+W4TNMRTRJP2mamZGXjq+YsGC9s4fM1z/dh/xyyKN
         PPaSOdBbN23xJQ3uB0HTEBGX47z1VBHUNW132iTnyefUVnCRcvdnOzJgBkTOizhpVPWd
         WJjB25CWEcv9XTf4Q9ta1U2gP+dkWAa+hlRYjylrxtvwXOyRUbZlQEf7OI5j61SgwAKt
         4BQw==
X-Forwarded-Encrypted: i=1; AJvYcCUAo5Fgb4lQEJANF3coPZnhHGwNm2Xnfe3khXrPU/2ih7m+eqjUW4U5GCOPiU297MqfFHXP79bSACR1Cw27Nd8q/jM6zfjEE4rsCI+u3p9t
X-Gm-Message-State: AOJu0YyJMLfIOA63NsZThdB6yp3zG4Fm3IhqoaSS+wXoTBP+OUgFBo15
	29Zw2xC0G11NiyQfjhGc2SKXoixy5CSUN5+3r8HgqgZ2uXQj9O2Vb2+BBFmnBmjBlISAFxgtb7z
	1yRcmWXVa0BxVswbWwSplD5gD8d44/tRzS4yMcw==
X-Google-Smtp-Source: AGHT+IFSMdyIfIbGBGXYm5Kik9d9uEJpH9ScqRFDIie2F6LdTFFPc+B9YVXd8Ov8NJK5dcfMNlMzl3+jbxfpj+TbqFA=
X-Received: by 2002:a17:907:60cd:b0:a7d:c46b:2241 with SMTP id
 a640c23a62f3a-a7dc4fae424mr1075049666b.29.1722884200398; Mon, 05 Aug 2024
 11:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240805173816.3722002-1-jesse@rivosinc.com> <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
 <ZrEebH2wdjRgfYCB@ghost>
In-Reply-To: <ZrEebH2wdjRgfYCB@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 5 Aug 2024 11:56:04 -0700
Message-ID: <CALs-HsshaOvxkJ1NhagL0TWqLJAjKAwyoHLEkdq-_n7rpXdF7Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_115642_142893_20D76C29 
X-CRM114-Status: GOOD (  25.86  )
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

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCAxMTo0OOKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMTE6Mzg6
MjNBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIE1vbiwgQXVnIDUsIDIwMjQgYXQg
MTA6MzjigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gQWRkIGEga2VybmVsIHBhcmFtZXRlciB0byB0aGUgdW5hbGlnbmVkIGFjY2VzcyBzcGVl
ZC4gVGhpcyBhbGxvd3MKPiA+ID4gc2tpcGluZyBvZiB0aGUgc3BlZWQgdGVzdHMgZm9yIHVuYWxp
Z25lZCBhY2Nlc3Nlcywgd2hpY2ggb2Z0ZW4gaXMgdmVyeQo+ID4gPiBzbG93Lgo+ID4gPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+ID4KPiA+
IEhvdyBjb21lIHRoaXMgaXMgYSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHJhdGhlciB0aGFuIGEg
S2NvbmZpZwo+ID4gb3B0aW9uPyBJIGNvdWxkIGJlIHdyb25nLCBzbyBJJ2xsIGxheSBvdXQgbXkg
cmF0aW9uYWxlIGFuZCBwZW9wbGUgY2FuCj4gPiBwaWNrIGl0IGFwYXJ0IGlmIEkndmUgZ290IGEg
YmFkIGFzc3VtcHRpb24uCj4gPgo+ID4gSSB0aGluayBvZiBjb21tYW5kbGluZSBwYXJhbWV0ZXJz
IGFzIChtb3N0bHkpIHNvbWV0aGluZyBlbmQgdXNlcnMKPiA+IHR3aWRkbGUgd2l0aCwgdmVyc3Vz
IGtjb25maWcgb3B0aW9ucyBhcyBzb21ldGhpbmcgc3lzdGVtIGJ1aWxkZXJzIHNldAo+ID4gdXAu
IEknZCBsYXJnZWx5IGV4cGVjdCBlbmQgdXNlcnMgbm90IHRvIG5vdGljZSB0d28gdGlja3MgYXQg
Ym9vdCB0aW1lLgo+ID4gSSdkIGV4cGVjdCBpdHMgc3lzdGVtIGJ1aWxkZXJzIGFuZCBmbGVldCBt
YW5hZ2Vycywgd2hvIGtub3cgdGhlaXIKPiA+IGhhcmR3YXJlIGFuZCBidWlsZCB0aGVpciBrZXJu
ZWxzIG9wdGltaXplZCBmb3IgaXQsIGFyZSB0aGUgb25lcyB3aG8KPiA+IHdvdWxkIHdhbnQgdG8g
c2hhdmUgb2ZmIHRoaXMgdGltZSBhbmQgZ28gc3RyYWlnaHQgdG8gdGhlIGtub3duIGFuc3dlci4K
PiA+IEFuZWNkb3RhbGx5LCBhdCBDaHJvbWVPUyB3ZSBoYWQgYSBzdHJvbmcgcHJlZmVyZW5jZSBm
b3IgS2NvbmZpZwo+ID4gb3B0aW9ucywgYXMgdGhleSB3ZXJlIGVhc2llciB0byBjb21wb3NlIGFu
ZCBtYWludGFpbiB0aGFuIGEgbG9vc2UgcGlsZQo+ID4gb2YgY29tbWFuZGxpbmUgYXJndW1lbnRz
Lgo+ID4KPiA+IFRoZSBjb21taXQgdGV4dCBkb2Vzbid0IGdvIGludG8gdGhlIHJhdGlvbmFsZSwg
aW50ZW5kZWQgYXVkaWVuY2UsIG9yCj4gPiBleHBlY3RlZCB1c2FnZSwgc28gbWF5YmUgbXkgZ3Vl
c3NlcyBtaXNzIHRoZSBtYXJrIG9uIHdoYXQgeW91J3JlCj4gPiB0aGlua2luZy4KPiA+IC1FdmFu
Cj4KPiBUaGVyZSB3YXMgYSBicmllZiBkaXNjdXNzaW9uIGFib3V0IHRoaXMgb24gSmVzc2UncyBz
ZXJpZXMgYWJvdXQgdmVjdG9yCj4gdW5hbGlnbmVkIHN1cHBvcnQgWzFdLiBUaGUgb3JpZ2luYWwg
aWRlYSB3YXMgdG8gdXNlIFppY2Nsc20gdG8gYWxsb3cKPiBwZW9wbGUgdG8gc2V0IHRoZSB1bmFs
aWduZWQgYWNjZXNzIHNwZWVkIG9uIHByZS1jb21waWxlZCBkaXN0cm8ga2VybmVscy4KPiBIb3dl
dmVyIFppY2Nsc20gaXNuJ3QgdXNlZnVsIHNvIHRoZSBhbHRlcm5hdGl2ZSByb3V0ZSB3YXMgdG8g
dXNlIGEKPiBrZXJuZWwgYXJnLiBUaGVyZSBpcyBhbHJlYWR5IHN1cHBvcnQgZm9yIGEgS2NvbmZp
ZywgdGhlIGtlcm5lbCBhcmcgaXMKPiBqdXN0IGFub3RoZXIgb3B0aW9uIGZvciB1c2Vycy4KPgo+
IExpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9hZjMxNTJiNi1hZGY3LTQwZmEt
YjJhMS04N2U2NmVlYzQ1YjBAcml2b3NpbmMuY29tLwo+IFsxXQoKQWggZ290IGl0LCB0aGFua3Mg
Zm9yIHRoZSBleHBsYW5hdGlvbiBDaGFybGllISBJZiB0aGVyZSBhcmUgY29uc3VtZXJzCmZvciB0
aGlzIHRoZW4gdGhlIGNvbmNlcHQgc2VlbXMgZmluZSB3aXRoIG1lLgotRXZhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
