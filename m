Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0266C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQoYixi9WimRVWRUY/kWWjI7psnOIYxEV0f8MXcrgAU=; b=s2XyvB1kZJhlTR
	V24B0T2NMc8biAwsLF3MF5dx9NLov5Jinac3shNZZqslE5yL4B3+oIrztHACRzocyLXEVC5LbPwSZ
	t/W0uJK0twZhgCZyR7PZ22hzURqZq9p/rxYOUCF5aeSA0HCcA4EjJSjy8u9x5m/Nzmj3eLkpLeqfz
	nr/3TBjkzT7jCbK43KwAJPKjbdKI5KzC8EO4a9vr0KigrGh3DTiyvWSA5IBiIR5E3cPqkuFoXaMln
	aoXZydyE/1q3xE9qqzENwPXKkolunpmXQSMnoNt2WqpO2s+XC/sxI2WsvFIholciwMAUHWjwGQwSG
	Xd9h5tAp4117DTOltz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0LoW-001a2D-0k;
	Tue, 07 Nov 2023 13:08:16 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0LoT-001a0T-1l
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 13:08:15 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-778a92c06d6so363868085a.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 05:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362491; x=1699967291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duB41CAVQAEHsTpboDBSVP82rtEMNlFgZnRIBiTx7QM=;
        b=wOe7ccIj4AZ4QoxvH3v9yX/rxEevVn4b2NNtbv9WiKjdHYdPQCwLweJgIpeKQrAiV5
         ZDo1cZ+YI+ytH4BrGZXW1x/XOKCUMdrCwaGhzMcVn1IATXfsq+sI1fQfh7M9d02nSscD
         Ze3XTSLvmUgFOFYhApomrZWQsOdzrrDrEIDZ3KWwG61/53wvl2vs9IE99trlPuqvpV+U
         46nyOPXh8Ainj//QVE5HtJZEaJ1bWxDJEq5nNQdc6Y3R87iT/RZP9M1tL+NvXYnNAH+1
         hwKKl/rwSnW7sUXG0zbnG2UBYkb4++MqRWmulJCoNq44JAitWRP0JlB9qb6RE4ZkAuDF
         IALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362491; x=1699967291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duB41CAVQAEHsTpboDBSVP82rtEMNlFgZnRIBiTx7QM=;
        b=KAiXmkWJbvK4yKiV24EntESsLfj777Hd66FsOAMclYxBnSunk60JxCb4zQJo7S04Ih
         0ybBoHhbSOwolwtcKzTtpbEgIOVjeH+WL6mesZ5IqllQOiN5spwrNfYQA12sqeVTSD+1
         2eOI8lyWAR7hkK9n0N/0lqsDyEG8+A7G1ZVPoVLMLabGirIqW5oa8iWHR4lalILa8G2s
         HAu94R1muGgQ4F242u0yWr6rERUoBXsnnDvBy6zCWO7G2W33utUes9hR1KnDeeVzm6hV
         t0/gcPUMj/fbPjjJgwscADnfpgnVKV1xqSVloXmdipqCU9/09a1aS2W7giS7Wf1kQpos
         /Nrg==
X-Gm-Message-State: AOJu0Ywhhw7Xz+YlHsCniNzBkQanrigmitzF3hCHKsRyP8JcD1yaeHVU
	TaSvaEMxGEs4MywxcDhVYSNaYR6DoqhDg4UnvcsaFw==
X-Google-Smtp-Source: AGHT+IGUEs/Z9qDF9Rm5YJWKfqOOEPOokXyTpuCNs8hFPpMccS+CxR+7fkZ7Pf/btUtItisYVanaHMrqI1zvjHLhVi8=
X-Received: by 2002:a05:6214:4103:b0:66d:1624:2200 with SMTP id
 kc3-20020a056214410300b0066d16242200mr38764786qvb.13.1699362491180; Tue, 07
 Nov 2023 05:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
 <20231104105907.1365392-8-vincent.guittot@linaro.org> <20231107103808.GF18944@willie-the-truck>
 <CAKfTPtBb+qea61OH-B0L=MHJWnQMLL80EBR-nSHZtoWTbYeHhw@mail.gmail.com> <20231107120103.GA19367@willie-the-truck>
In-Reply-To: <20231107120103.GA19367@willie-the-truck>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 7 Nov 2023 14:07:58 +0100
Message-ID: <CAKfTPtA_8fN-op7FhMg=zxjD9rNEvC_Lm_x7J0BK+YCwxUF+Og@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] arm64/amu: Use capacity_ref_freq to set AMU ratio
To: Will Deacon <will@kernel.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, beata.michalska@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_050813_585106_89290E4D 
X-CRM114-Status: GOOD (  36.36  )
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

T24gVHVlLCA3IE5vdiAyMDIzIGF0IDEzOjAxLCBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDA3LCAyMDIzIGF0IDEyOjE4OjIwUE0gKzAxMDAsIFZp
bmNlbnQgR3VpdHRvdCB3cm90ZToKPiA+IE9uIFR1ZSwgNyBOb3YgMjAyMyBhdCAxMTozOCwgV2ls
bCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFNhdCwgTm92
IDA0LCAyMDIzIGF0IDExOjU5OjA3QU0gKzAxMDAsIFZpbmNlbnQgR3VpdHRvdCB3cm90ZToKPiA+
ID4gPiBVc2UgdGhlIG5ldyBjYXBhY2l0eV9yZWZfZnJlcSB0byBzZXQgdGhlIHJhdGlvIHRoYXQg
aXMgdXNlZCBieSBBTVUgZm9yCj4gPiA+ID4gY29tcHV0aW5nIHRoZSBhcmNoX3NjYWxlX2ZyZXFf
Y2FwYWNpdHkoKS4KPiA+ID4gPiBUaGlzIGhlbHBzIHRvIGtlZXAgZXZlcnl0aGluZyBhbGlnbmVk
IHVzaW5nIHRoZSBzYW1lIHJlZmVyZW5jZSBmb3IKPiA+ID4gPiBjb21wdXRpbmcgQ1BVcyBjYXBh
Y2l0eS4KPiA+ID4gPgo+ID4gPiA+IFRoZSBkZWZhdWx0IHZhbHVlIG9mIHRoZSByYXRpbyAoc3Rv
cmVkIGluIHBlcl9jcHUoYXJjaF9tYXhfZnJlcV9zY2FsZSkpCj4gPiA+ID4gZW5zdXJlcyB0aGF0
IGFyY2hfc2NhbGVfZnJlcV9jYXBhY2l0eSgpIHJldHVybnMgbWF4IGNhcGFjaXR5IHVudGlsIGl0
IGlzCj4gPiA+ID4gc2V0IHRvIGl0cyBjb3JyZWN0IHZhbHVlIHdpdGggdGhlIGNwdSBjYXBhY2l0
eSBhbmQgY2FwYWNpdHlfcmVmX2ZyZXEuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IEd1aXR0b3QgPHZpbmNlbnQuZ3VpdHRvdEBsaW5hcm8ub3JnPgo+ID4gPiA+IC0tLQo+
ID4gPiA+ICBhcmNoL2FybTY0L2tlcm5lbC90b3BvbG9neS5jICB8IDI2ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gPiA+ID4gIGRyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMgIHwgMTIg
KysrKysrKysrKystCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvYXJjaF90b3BvbG9neS5oIHwgIDEg
Kwo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3RvcG9s
b2d5LmMgYi9hcmNoL2FybTY0L2tlcm5lbC90b3BvbG9neS5jCj4gPiA+ID4gaW5kZXggODE3ZDc4
OGNkODY2Li42MTVjMWEyMDEyOWYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJu
ZWwvdG9wb2xvZ3kuYwo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3RvcG9sb2d5LmMK
PiA+ID4gPiBAQCAtODIsNyArODIsMTIgQEAgaW50IF9faW5pdCBwYXJzZV9hY3BpX3RvcG9sb2d5
KHZvaWQpCj4gPiA+ID4gICN1bmRlZiBwcl9mbXQKPiA+ID4gPiAgI2RlZmluZSBwcl9mbXQoZm10
KSAiQU1VOiAiIGZtdAo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRpYyBERUZJTkVfUEVSX0NQVV9SRUFE
X01PU1RMWSh1bnNpZ25lZCBsb25nLCBhcmNoX21heF9mcmVxX3NjYWxlKTsKPiA+ID4gPiArLyoK
PiA+ID4gPiArICogRW5zdXJlIHRoYXQgYW11X3NjYWxlX2ZyZXFfdGljaygpIHdpbGwgcmV0dXJu
IFNDSEVEX0NBUEFDSVRZX1NDQUxFIHVudGlsCj4gPiA+ID4gKyAqIHRoZSBDUFUgY2FwYWNpdHkg
YW5kIGl0cyBhc3NvY2lhdGVkIGZyZXF1ZW5jeSBoYXZlIGJlZW4gY29ycmVjdGx5Cj4gPiA+ID4g
KyAqIGluaXRpYWxpemVkLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArc3RhdGljIERFRklORV9QRVJf
Q1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGxvbmcsIGFyY2hfbWF4X2ZyZXFfc2NhbGUpID0gIDFV
TCA8PCAoMiAqIFNDSEVEX0NBUEFDSVRZX1NISUZUKTsKPiA+ID4KPiA+ID4gVGhpcyBkb2Vzbid0
IHNlZW0gdG8gbWF0Y2ggdGhlIGNvbW1lbnQ/IFNDSEVEX0NBUEFDSVRZX1NDQUxFIGRvZXNuJ3Qg
aGF2ZQo+ID4gPiB0aGUgJzIgKicgbXVsdGlwbGllci4KPiA+Cj4gPiBUaGUgY29tbWVudCBpbiBm
cmVxX2ludl9zZXRfbWF4X3JhdGlvKCkgc2F5czoKPiA+Cj4gPiAqIFdlIHVzZSBhIGZhY3RvciBv
ZiAyICogU0NIRURfQ0FQQUNJVFlfU0hJRlQgLT4gU0NIRURfQ0FQQUNJVFlfU0NBTEXCsgo+ID4g
KiBpbiBvcmRlciB0byBlbnN1cmUgYSBnb29kIHJlc29sdXRpb24gZm9yIGFyY2hfbWF4X2ZyZXFf
c2NhbGUgZm9yCj4gPiAqIHZlcnkgbG93IHJlZmVyZW5jZSBmcmVxdWVuY2llcyAoZG93biB0byB0
aGUgS0h6IHJhbmdlIHdoaWNoIHNob3VsZAo+ID4gKiBiZSB1bmxpa2VseSkuCj4gPgo+ID4gVGhl
biB0aGVyZSBpcyBhICAiICAqIGFyY2hfbWF4X2ZyZXFfc2NhbGUpID4+IFNDSEVEX0NBUEFDSVRZ
X1NISUZUIgo+ID4gd2hlbiBjb21wdXRpbmcgdGhlIHNjYWxlIHdoaWNoIGJyaW5ncyB0aGUgcmVz
dWx0IGJhY2sgdG8KPiA+IFNDSEVEX0NBUEFDSVRZX1NISUZUCj4KPiBBaCwgSSBzZWU7IEknZCBu
b3Qgc3BvdHRlZCB0aGF0IGFtdV9zY2FsZV9mcmVxX3RpY2soKSBpcyBkb2luZyBzb21lCj4gYXJp
dGhtZXRpYyBvbiB0aGUgdmFsdWUgKGl0IGRvZXNuJ3QgcmV0dXJuIGFueXRoaW5nIGJlY2F1c2Ug
aXQncyAndm9pZCcpLgo+IEl0J3Mgc2xpZ2h0bHkgY29uZnVzaW5nIGJlY2F1c2UgdGhlIGNvbW1l
bnQgdGFsa3MgYWJvdXQgU0NIRURfQ0FQQUNJVFlfU0NBTEUKPiB3aGVyZWFzIGFsbCB0aGUgY29k
ZSB3b3JrcyBvbiB0aGUgc2hpZnQsIGJ1dCBJIGdldCBpdCBub3cuCj4KPiA+ID4gPiAgc3RhdGlj
IERFRklORV9QRVJfQ1BVKHU2NCwgYXJjaF9jb25zdF9jeWNsZXNfcHJldik7Cj4gPiA+ID4gIHN0
YXRpYyBERUZJTkVfUEVSX0NQVSh1NjQsIGFyY2hfY29yZV9jeWNsZXNfcHJldik7Cj4gPiA+ID4g
IHN0YXRpYyBjcHVtYXNrX3Zhcl90IGFtdV9maWVfY3B1czsKPiA+ID4gPiBAQCAtMTEyLDE0ICsx
MTcsMTQgQEAgc3RhdGljIGlubGluZSBib29sIGZyZXFfY291bnRlcnNfdmFsaWQoaW50IGNwdSkK
PiA+ID4gPiAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gLXN0
YXRpYyBpbnQgZnJlcV9pbnZfc2V0X21heF9yYXRpbyhpbnQgY3B1LCB1NjQgbWF4X3JhdGUsIHU2
NCByZWZfcmF0ZSkKPiA+ID4gPiArdm9pZCBmcmVxX2ludl9zZXRfbWF4X3JhdGlvKGludCBjcHUs
IHU2NCBtYXhfcmF0ZSkKPiA+ID4gPiAgewo+ID4gPiA+IC0gICAgIHU2NCByYXRpbzsKPiA+ID4g
PiArICAgICB1NjQgcmF0aW8sIHJlZl9yYXRlID0gYXJjaF90aW1lcl9nZXRfcmF0ZSgpOwo+ID4g
PiA+Cj4gPiA+ID4gICAgICAgaWYgKHVubGlrZWx5KCFtYXhfcmF0ZSB8fCAhcmVmX3JhdGUpKSB7
Cj4gPiA+ID4gLSAgICAgICAgICAgICBwcl9kZWJ1ZygiQ1BVJWQ6IGludmFsaWQgbWF4aW11bSBv
ciByZWZlcmVuY2UgZnJlcXVlbmN5LlxuIiwKPiA+ID4gPiArICAgICAgICAgICAgIFdBUk5fT05D
RSgxLCAiQ1BVJWQ6IGludmFsaWQgbWF4aW11bSBvciByZWZlcmVuY2UgZnJlcXVlbmN5LlxuIiwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIGNwdSk7Cj4gPiA+ID4gLSAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gPiAg
ICAgICB9Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAvKgo+ID4gPiA+IEBAIC0xMzksMTIgKzE0NCwx
MiBAQCBzdGF0aWMgaW50IGZyZXFfaW52X3NldF9tYXhfcmF0aW8oaW50IGNwdSwgdTY0IG1heF9y
YXRlLCB1NjQgcmVmX3JhdGUpCj4gPiA+ID4gICAgICAgcmF0aW8gPSBkaXY2NF91NjQocmF0aW8s
IG1heF9yYXRlKTsKPiA+ID4gPiAgICAgICBpZiAoIXJhdGlvKSB7Cj4gPiA+ID4gICAgICAgICAg
ICAgICBXQVJOX09OQ0UoMSwgIlJlZmVyZW5jZSBmcmVxdWVuY3kgdG9vIGxvdy5cbiIpOwo+ID4g
PiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gKyAgICAgICAgICAgICBy
ZXR1cm47Cj4gPiA+ID4gICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgcGVyX2NwdShhcmNo
X21heF9mcmVxX3NjYWxlLCBjcHUpID0gKHVuc2lnbmVkIGxvbmcpcmF0aW87Cj4gPiA+ID4gKyAg
ICAgV1JJVEVfT05DRShwZXJfY3B1KGFyY2hfbWF4X2ZyZXFfc2NhbGUsIGNwdSksICh1bnNpZ25l
ZCBsb25nKXJhdGlvKTsKPiA+ID4KPiA+ID4gV2h5IGlzIFdSSVRFX09OQ0UoKSBub3cgbmVlZGVk
Pwo+ID4KPiA+IHRoZSB0aWNrIGNhbiBhbHJlYWR5IHVzZSBpdC4gV2Ugd2FudCB0byBtYWtlIHN1
cmUgdG8gdXNlIGVpdGhlciB0aGUKPiA+IG9sZCBvciB0aGUgbmV3IG9uZSBidXQgbm90IGFuIGlu
dGVybWVkaWF0ZSB2YWx1ZQo+Cj4gSXNuJ3QgdGhhdCBhbHJlYWR5IHRoZSBjYXNlIHdpdGhvdXQg
dGhpcyBwYXRjaD8gSW4gb3RoZXIgd29yZHMsIHRoaXMgc2hvdWxkCj4gYmUgYSBzZXBhcmF0ZSBj
aGFuZ2UuCgpDdXJyZW50bHkgdGhlIHJhdGlvIGlzIHNldCBpbiB0aGUgc2FtZSBub3RpZmllciBj
YWxsYmFjayBiZWZvcmUKcmVnaXN0ZXJpbmcgdGhlIEFNVSBmdW5jdGlvbiBpbiB0b3BvbG9neV9z
Y2FsZV9mcmVxX3RpY2sgd2hlcmVhcyB0aGVyZQphcmUgbm93IGRvbmUgaW4gMiBzZXBhcmF0ZSBu
b3RpZmllciBjYWxsYmFja3MgKHN0aWxsIGZvciB0aGUgc2FtZQpldmVudCkgYnV0IHdlIGRvbid0
IGtub3cgdGhlIG9yZGVyCgo+Cj4gV2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
