Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D8FC531DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtm9gCpvmfvn0ELz6Hkg4CoMRPid+xkAj/qFafZ5MqQ=; b=wvCbCh0C2PnTcp
	XE0YA8rzBD6c/D9eVr8fPnCKN57fkkBbK1gFkFMZywYDcANYzbTNlXrjuOLqX1+UzbfjAUsZMzV+E
	THRhjxkhSmgHEmn363HBQuKdVXfZcX0K6rDIVzjk7OpnKoZswKNGlg4aWJsYcWmTTuUI2W6127aNq
	4j525bwI8cHZ1MAHYR5EUgpQdEwsQE4iXTgC/tf9BGtA524omiY53EGabi8I43Gqwg60yfG5/3bU6
	MHkxmmH3xUg/5ARyXatQdtpmoG1Ucdr/Rz4ebiIfENOqA16k5aVF+Yp290t5dY9E4YlU98vvdAmOR
	DHU3wHSDsL2kqdGzNGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6cN-00000005obZ-328f;
	Wed, 14 Aug 2024 05:32:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6cK-00000005oaj-2q1g
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 05:32:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so4515256a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723613535; x=1724218335; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MW1voiVkiK6ybB7ai4q3hjESE3gnEZP9taq8A0sM4Ac=;
        b=V5S3ezVvFg8CtHQev3y8ofi4bpCsWClUU5S8URbIlA3A3l58ZNUyRANSJtH5uGNGrp
         sb/l8mBoDuudF2iR3PDxDC1FwPkIlyahJ2LU6MjprLhVQ7uJ1bDJpdXWuXJl4ut1rtWi
         o8UmvRbQdX0MrlyczNub/6/liRDM2bBA88YhWXY+EU+MQMYn7EOIRCW161MGZGoy9Eez
         4qzhYRxutoZw0Xfe/WZI72Ld9TFasxVL9Bzwg67IiQzMlYfzLl4mTGQQwazpnOgm5y3W
         tyxDXpzjlhvOi5TwTVfNxUg317hcWYW8n5EAau+D/q+iMgOboZO1LEgYK/8+AfsJhk3p
         /F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613535; x=1724218335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MW1voiVkiK6ybB7ai4q3hjESE3gnEZP9taq8A0sM4Ac=;
        b=B3h4fhqcMtq4JBaoQD09E/VmJH3w5OYtB43nQ05OwzbboDlczNYqOscR7Uk5kSbXOO
         mQ5Z2jHYc95BgPHygir932Mz0DA13CnzaR+MJuVh0+RxsJPWxhQbPzLd0VMGH28dombF
         0FctrPyBtATKGJuKhDH4kpbb1MmZvhejAH1fmXDM0gMYBA61Uf2HdIn4Cig+lMsU6p5Y
         nRB51U11+ziGhf67ilIlfUIxYJyMNGRNJYjwo6ftDmCqV+r8pJtIw+HpGcsEuALDoTYS
         +e70s269wwqFTnSYrXlttXB5GFCGWY7OrTeUcwUrNIDuxzUwu1eetNGilUbCY9EHcGFu
         H94w==
X-Forwarded-Encrypted: i=1; AJvYcCV2r3lvEjR1wUd3fsamwvPvsYdgVfiDMRc7IY4I6/t6eQAhaiSmNbIjLqomuqj4HEPAqP4TWXOfX4o2HSX8k3fIsDXlBR5JmqT8fvs7ftIG
X-Gm-Message-State: AOJu0YwuOOLI9jNKxKPeFtwICPEFxcP1TCRaCMJfOBLSpBja4fmkKnwq
	5MLKBzCB5181Fb2MYYJ2RdB7hDL6bHcTSqqdqiWxDyjdl67I97e2+vdHvGBqQzs=
X-Google-Smtp-Source: AGHT+IG+HZ5EWjYic/b5QeOk5+VPgQJcNuvLcWtvoSZVAm6KKwkjPRIE2/NWQY79ieZs+RokBTE9nw==
X-Received: by 2002:a05:6a20:9f44:b0:1c6:9e5e:2ec4 with SMTP id adf61e73a8af0-1c8eaf8b3c0mr2418490637.50.1723613535290;
        Tue, 13 Aug 2024 22:32:15 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7ca35fsm629732a91.9.2024.08.13.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:32:14 -0700 (PDT)
Date: Wed, 14 Aug 2024 11:02:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v8 01/17] arm64: PCI: Migrate ACPI related functions to
 pci-acpi.c
Message-ID: <ZrxBU4cPA6QAaxIs@sunil-laptop>
References: <20240812005929.113499-2-sunilvl@ventanamicro.com>
 <20240812180912.GA286962@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812180912.GA286962@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_223216_763541_6B877557 
X-CRM114-Status: GOOD (  11.29  )
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

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDE6MDk6MTJQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAwNjoyOToxM0FNICswNTMwLCBTdW5pbCBW
IEwgd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb25zIGRlZmluZWQgaW4gYXJtNjQgZm9yIEFDUEkgc3Vw
cG9ydCBhcmUgcmVxdWlyZWQKPiA+IGZvciBSSVNDLVYgYWxzby4gVG8gYXZvaWQgZHVwbGljYXRp
b24sIG1vdmUgdGhlc2UgZnVuY3Rpb25zCj4gPiB0byBjb21tb24gbG9jYXRpb24uCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4g
QWNrZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gPiBBY2tlZC1i
eTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPiA+IFRlc3RlZC1ieTogQmrDg8K2cm4g
VMODwrZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBMb29rcyBsaWtlICJCasO2cm4gVMO2
cGVsIiBnb3QgY29ycnVwdGVkIHNvbWV3aGVyZSBhbG9uZyB0aGUgbGluZS4KPgpUaGFua3MgZm9y
IG5vdGljaW5nIGl0LCBCam9ybiEuIE5vdCBzdXJlIGhvdyBpdCBoYXBwZW5lZC4gU29ycnkgYWJv
dXQKdGhhdC4gTGV0IG1lIHdhaXQgZm9yIFJhZmFlbCdzIGlucHV0cy4gSSBob3BlIG1haW50YWlu
ZXJzIGNhbiBlZGl0IGl0LgpPdGhlcndpc2UsIEkgY2FuIHVwZGF0ZSBhbmQgc2VuZCBhbm90aGVy
IHJldmlzaW9uIGlmIHJlcXVpcmVkLgoKVGhhbmtzIQpTdW5pbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
