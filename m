Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC2C54731
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IStsyVkcL/Q5p/ADYoVvqs76nBZq4kr4YLPBYsfPDK4=; b=agm/KaRZDoQiwO
	+5Q8cizQ9PVJNtOsKm+e9YGqD5T3t208imdNpzC4WECXxquN9nlxxQhE+urdxqAVXMjQItGAI11ki
	PgqLwBCoZipCixtBKjLprq1nEzok6yfETRYSEo0BOn46glSfwIIjdc1gbTEIRPR+VwC8x60XJBtMw
	a6JMNfz0OD4La+5x9XC/Osb+UIgBx19nsS+XM0+7PcpmT4OCfgT3I1pxCafTtFgnTaZV4uG8VMIXS
	SIKLu96CvoBHuf670d8Bsqf8cHOQjjm5tgYRFiw23DR1uPliYpMEX/AXUTK7C65Gay1I8N5YpaCM7
	OHh85zPl7zw3lpXNTsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0hx-0000000CRdr-2Wrp;
	Tue, 27 Aug 2024 18:14:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0go-0000000CRL0-1pJf
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 18:13:11 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7143ae1b48fso3372726b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724782389; x=1725387189; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MPA+hJJLDVmD4KICeVltx2lJ4690a/Dvth1Aghkw/GI=;
        b=Rtd05QW8BEDQAFtrU5iQ48KgF1sj4OyZzIQron+28ZWnPohN2pQFmyLIZEn4Nbk7DY
         pEwPy1JmwBqUmL7FhQLRvXpHJDqfhHSFnug90uCILCUoXCrJ5+149LS6ubvlRk5YXbtH
         yLhlds6b4w6wYzKrLCZoR1WuHh9OJC6DmH+MYzw1/VXyYh3TwnOlDdtqCyQnZ7US+iPS
         BcLTO4nwLaT+QsD6wu9vxnzp5laZfVGnbjBjDZMfHiKrpX091C9SNv37p8Q+We0DYXEY
         xTURtVq23w/OruNG3LyeMmYRPKyZhjPwWoTuKrQxL15Q5IkxjWcDBa3fivhjgeaE58SF
         OH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782389; x=1725387189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPA+hJJLDVmD4KICeVltx2lJ4690a/Dvth1Aghkw/GI=;
        b=Venn/ybJuHCpzgiGYa0goklWBpdEOwQqB83rYIAasVb9t+Ifzxx/McKDcwlcJpk/lQ
         1pxlJqUTc9dk1OG8IJoHREDcrJg69vwi1Cx6aeip0BjAct+yt9t4RvSLuWhPFDuMsAGz
         DEEdIQLj4k66PO+rgvJP/RufM+3pkukvYNLe6Uaxa7ZNn+yVYtL9Icv4nik0BrMq10c8
         6YVYvadqMWeAbLEK0Mj+S6LUpZmy3qKTRHxf3YLNDQ759+XU6A7IC9EMbupyyc1+GhCC
         ge8T7zughSskdDMnCw7zwGpChDp3y0K+nj05mtALxQehaegRb7QOYkrIJrefhb+/CjgE
         T/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWSWW1+CJPbhNGeXcNZYTpNtQxwp+3cxIZ/GoTfRPyFpOqhok3Lp7FY+5JQvclXjbRCihBeqPNuN0y8XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzecjvVgpTAsmJfCsEjeuQmUv07Nat3UCYv8XdDztL77HVa5kcd
	cyW6xAWcwX7hcx9yQto7sEMwRcvHPzJW8pGNqplgfDJgiz9gqMfNjR8Pk6dajCM=
X-Google-Smtp-Source: AGHT+IGEsVPP4TjFJ+n/ifWb2tjPXQhtvEJKI4QpcXf0fpsIED85YBXgVczc0V+0pl8DdWJzUA5R6g==
X-Received: by 2002:a05:6a00:91db:b0:70d:311b:8569 with SMTP id d2e1a72fcca58-71445ed4f93mr12988732b3a.26.1724782389449;
        Tue, 27 Aug 2024 11:13:09 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e09c3sm8820322b3a.122.2024.08.27.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:13:08 -0700 (PDT)
Date: Tue, 27 Aug 2024 23:42:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller
 support
Message-ID: <Zs4XKootCrW5ZPy7@sunil-laptop>
References: <87mskzcnmf.ffs@tglx>
 <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop>
 <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx>
 <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
 <Zs4HCZH3M9nRXUvu@sunil-laptop>
 <CAJZ5v0i-8N8VG-D4FRh0qFxt44Ax4TKY_CiFhZxLCzkhQrt0=Q@mail.gmail.com>
 <Zs4NcmM79kMUc7Ol@sunil-laptop>
 <CAJZ5v0hRWxNSrx9XPBdsU-mQpDurRJAUmzHtHNkyCTf0Hz1TgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hRWxNSrx9XPBdsU-mQpDurRJAUmzHtHNkyCTf0Hz1TgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_111310_505728_282AA423 
X-CRM114-Status: GOOD (  24.23  )
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMDc6NTY6NTJQTSArMDIwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgNzozMeKAr1BNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEF1ZyAyNywg
MjAyNCBhdCAwNzoxMjoxMVBNICswMjAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4g
T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgNzowNOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgQXVnIDI3LCAyMDI0
IGF0IDA2OjIwOjI0UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+ID4g
T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6MjLigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwgQXVn
IDI2IDIwMjQgYXQgMTk6MjcsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gPiA+ID4gPiA+
IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDc6MjLigK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4+IFRoZXJlIHdpbGwgYmUgYSBjb25m
bGljdCBpbiBQTElDIGlycWNoaXAgZHJpdmVyIGR1ZSB0byBhIHJlY2VudCBwYXRjaCBbMV0uCj4g
PiA+ID4gPiA+ID4+IFRoaXMgcGF0Y2ggaXMgbm90IGluIGxhdGVzdCBSQzUgcmVsZWFzZSBidXQg
aW4gbGludXgtbmV4dC4gSSB1c3VhbGx5IGJhc2UgdGhlCj4gPiA+ID4gPiA+ID4+IHNlcmllcyBv
biBsYXRlc3QgUkMgcmVsZWFzZS4gU2hvdWxkIEkgcmViYXNlIHRvIGxpbnV4LW5leHQgaW4gdGhp
cyBjYXNlCj4gPiA+ID4gPiA+ID4+IGFuZCBzZW5kIHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoZSBz
ZXJpZXMgcmVzb2x2aW5nIHRoZSBjb25mbGljdD8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IE5vLCBwbGVhc2UgZG9uJ3QuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGF0IHdpbGwg
YmUgcmVzb2x2ZWQgYXQgdGhlIG1lcmdlIHRpbWUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEFs
dGVybmF0aXZlbHkgeW91IGNhbiBwdWxsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IGlycS11
cmdlbnQtMjAyNC0wOC0yNQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiB3aGljaCBJJ20gYWJvdXQg
dG8gc2VuZCB0byBMaW51cyBsYXRlc3QgdG9tb3Jyb3cgbW9ybmluZy4gVGhhdCBjb250YWlucwo+
ID4gPiA+ID4gPiB0aGUgY29uZmxpY3RpbmcgY2hhbmdlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNv
IEkndmUgYXBwbGllZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiB0aGUgYWJvdmUuCj4gPiA+ID4gPgo+
ID4gPiA+IFRoYW5rcyEKPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBpbmNsdWRlZCBhIGZ1bGwtc3dp
bmcgcmViYXNlIG9mIHRoZSBsYXN0IHBhdGNoLCB3aGljaCBJIGhvcGUgSSd2ZQo+ID4gPiA+ID4g
ZG9uZSBjb3JyZWN0bHksIGJ1dCBTdW5pbCBwbGVhc2Ugc2VlCj4gPiA+ID4gPgo+ID4gPiA+IFll
YWgsIHNvcnJ5IGFib3V0IHRoYXQuIFlvdSBoYXZlIHJlc29sdmVkIG1vc3Qgb2YgdGhlIGNvbmZs
aWN0cyBidXQgZmV3Cj4gPiA+ID4gYXJlIG1pc3NpbmcgKHdoaWNoIHdlcmUgbm90IG9idmlvdXMg
YW55d2F5KS4gQ291bGQgeW91IHBsZWFzZSB0YWtlIGJlbG93Cj4gPiA+ID4gY29tbWl0IGFuZCBz
cXVhc2g/Cj4gPiA+ID4KPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9saW51eC9j
b21taXQvYzg1ZjlkMGRjMzFjMGU3NzkxNmVjZGJiNDU3NzQ4YzA1Y2Y0ZTc1YQo+ID4gPgo+ID4g
PiBDYW4geW91IHBsZWFzZSBzZW5kIG1lIGEgZGlmZj8KPiA+ID4KPiA+IEhpIFJhZmFlbCwKPiA+
Cj4gPiBJIGhhdmUgc2VudCB0aGUgZGlmZiB0byB5b3UuIEhvcGUgdGhhdCBpcyBmaW5lLgo+IAo+
IFNxdWFzaGVkIGFuZCBwdXNoZWQgb3V0LCBwbGVhc2Ugc2VlCj4gCj4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmFmYWVsL2xpbnV4LXBtLmdpdC9jb21t
aXQvP2g9YmxlZWRpbmctZWRnZSZpZD05MTUzZmRhZTMwODY3ZmU1ZDcxZjZhMTViOGExOTc0ZDdl
ODAxZjM5Cj4gCkxHVE0uIFRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
