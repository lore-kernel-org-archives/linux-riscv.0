Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CE8C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=k3/yS1BgWa1CRvMC12nq3EEK2JP9FsQaf037yEGpMBc=; b=cOHcbJqa7Yjp7Ku98mPkt3Obep
	Iq40vlgdZ24x0EQzVQyyr8wwkWwdkzIqHt6BSTCX5cgOV21fnqXR1j/7zfd/Pi0Kad0DWoQLPx8Xc
	t+7I+GVF4R3OOH0VAe2+tzV6P3ARzw87nDlO6HCpqc2Q1A5/D2OOZVyv/sQeNJsYhBMjoJ0BHGOjW
	XJ7qds6BeFMEN8x4BzIunKayS5xckMlpa7itJ8AsIbXOrNtsJCRwq1GoOHnFZKOM3f0wN66EhmRTz
	ivVPow/q+A1uAZGL7BYPKZ5C7RjpYBnd9kkkyxf62Fj21Qb8aOoSoB2M9Qq4RxTeGzUxuwlIwRer1
	Pg/5AIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYxQ-0000000AMMU-3Soa;
	Fri, 23 Feb 2024 17:03:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdYxJ-0000000AMHH-46y0
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 17:03:28 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e4ca46ab04so366323b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708707801; x=1709312601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aacxeyvs8pRrr+XMTi5BArTJJELber83CslPV0NTJHc=;
        b=F1PockBBcwT8zDbjC/idM6+IZaeqsaSyMooUd2sfGlpqU6OOHV1dOH4lI/3k5TNaCQ
         H2cd3DM5JM1s9Yss4TAIG/uGXEDbFYATUUsGIhxQXJZGKfIRIYOIlf2CJVns7xOr6YOl
         dgUlzvGuJJXnoCo3Xb6vcWpEAGUoxh+b49APGN0GbLK1oBSWburHu1RXD1y0inY/Q84/
         BlihDH0D4GidLHS7YI4VDpVz93kLKNtCsmBeMWJAacmN7hcEbPwHpA2HurhX+cZVrWVu
         /1NBCXdwzCv2B9Hl46tX0U89298CfLfVbp/dks0fB0rFrq3iPQfJZy+AHeaCuPuDLBd0
         j4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708707801; x=1709312601;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aacxeyvs8pRrr+XMTi5BArTJJELber83CslPV0NTJHc=;
        b=WNDD8957ggI8rrVepRtpUEFoutN1+JvPus5rcL5LRcF6MTlo88bNhCEWyy2Z7KK0Bf
         z+IqK1AAQpmkNpZ5QYoGJKdhfqUe6OdpNlYzfXwkfuIZHSI/3gwVNjYNAzEIFQmuIvF0
         F6bxyFd5vW5MZXJ+C+ta0qaasUTOWqtBP8flO7VgWEOLwV6xiB5mt5gMH3oMK3VNdjaE
         L8Ec8zBNmdzPGUeDZ/ZCMC/mqd1KNOqwpX5mkNjdNlDgAlkmhZTJ4QOXuiBGJVD5ejU4
         Lij3R6t1uIlMn3LhktFyOy7PqjgtY0EyDK/OPcdKyxMRCwI9k6VKrTBXpniZ7brjcqDq
         drZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHQ/MiefL9+vbce6wHeAWFrPEM/gtBxYvW9fc9tFfAr2imjQhd2DVogpqWhvppJ51d8BqkKvRjrhZ8keJDVPYpWHFE5nQvPsEWzVEp9bA8
X-Gm-Message-State: AOJu0YzyJsQqD3aqWiFKXT943XUwdDFaGLY5V0aE44XD/P1gxNUKqffy
	rQW+CpPQzOJjiQPC6PUhu4E2kjfQ1caH39ThHTez3LQaxwNO39+FdanqTz6JXeQ=
X-Google-Smtp-Source: AGHT+IFtp6PrL7qLNfAgwX9hC+vKzzUuG66HdXTpXcbOlmpFEjv7iDoMORYm5jpgRpXx+2cv4WbQiQ==
X-Received: by 2002:a05:6a21:31c7:b0:1a0:df64:26c with SMTP id zb7-20020a056a2131c700b001a0df64026cmr411105pzb.16.1708707801358;
        Fri, 23 Feb 2024 09:03:21 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id h11-20020a63530b000000b005dc3fc53f19sm12494448pgb.7.2024.02.23.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:03:20 -0800 (PST)
Date: Fri, 23 Feb 2024 09:03:20 -0800 (PST)
X-Google-Original-Date: Fri, 23 Feb 2024 09:03:11 PST (-0800)
Subject: Re: [PATCH v3] RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs
In-Reply-To: <CAJF2gTRs-vycC1yTWiKrpy6kUw5uyjFFngESWe9EFdX-UZA+8w@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-08ef104c-cc9b-47fc-baa2-27d082081f52@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_090326_462587_4AE28550 
X-CRM114-Status: GOOD (  32.72  )
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

T24gRnJpLCAyMyBGZWIgMjAyNCAwMzozODoxNyBQU1QgKC0wODAwKSwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gT24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgNzozMeKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IEZyb206IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgo+Pgo+PiBCZWZvcmUgYXR0ZW1wdGluZyB0byBzdXBwb3J0IHRo
ZSBwcmUtcmF0aWZpY2F0aW9uIHZlcnNpb24gb2YgdmVjdG9yCj4+IGZvdW5kIG9uIG9sZGVyIFQt
SGVhZCBDUFVzLCBkaXNhbGxvdyAidiIgaW4gcmlzY3YsaXNhIG9uIHRoZXNlCj4+IHBsYXRmb3Jt
cy4gVGhlIGRlcHJlY2F0ZWQgcHJvcGVydHkgaGFzIG5vIGNsZWFyIHdheSB0byBjb21tdW5pY2F0
ZQo+PiB0aGUgc3BlY2lmaWMgdmVyc2lvbiBvZiB2ZWN0b3IgdGhhdCBpcyBzdXBwb3J0ZWQgYW5k
IG11Y2ggb2YgdGhlIHZlbmRvcgo+PiBwcm92aWRlZCBzb2Z0d2FyZSBwdXRzICJ2IiBpbiB0aGUg
aXNhIHN0cmluZy4gcmlzY3YsaXNhLWV4dGVuc2lvbnMKPj4gc2hvdWxkIGJlIHVzZWQgaW5zdGVh
ZC4gVGhpcyBzaG91bGQgbm90IGJlIHRvbyBtdWNoIG9mIGEgYnVyZGVuIGZvcgo+PiB0aGVzZSBz
eXN0ZW1zLCBhcyB0aGUgdmVuZG9yIHNoaXBwZWQgZGV2aWNldHJlZXMgYW5kIGZpcm13YXJlIGRv
IG5vdAo+PiB3b3JrIHdpdGggYSBtYWlubGluZSBrZXJuZWwgYW5kIHdpbGwgcmVxdWlyZSB1cGRh
dGluZy4KPj4KPj4gV2UgY2FuIGxpbWl0IHRoaXMgcmVzdHJpY3Rpb24gdG8gb25seSBpZ25vcmUg
diBpbiByaXNjdixpc2Egb24gQ1BVcwo+PiB0aGF0IHJlcG9ydCBULUhlYWQncyB2ZW5kb3IgSUQg
YW5kIGEgemVybyBtYXJjaGlkLiBOZXdlciBULUhlYWQgQ1BVcwo+PiB0aGF0IHN1cHBvcnQgdGhl
IHJhdGlmaWVkIHZlcnNpb24gb2YgdmVjdG9yIHNob3VsZCByZXBvcnQgbm9uLXplcm8KPj4gbWFy
Y2hpZCwgYWNjb3JkaW5nIHRvIEd1byBSZW4gWzFdLgo+IEFja2VkLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPgo+IFRoeCwgdGhpcyBoZWxwcyB0aGUgbmV3ZXN0IGFwcGxpY2F0aW9u
IGRpc2FibGUgdmVjdG9yXzEwIHdoZW4gb24gdGhlCj4gb2xkIFh1YW5UaWUgcHJvY2Vzc29yLgoK
VGhhbmtzLgoKSSBxdWV1ZWQgdGhpcyB1cCBmb3IgdGVzdGluZyBmb3IgZml4ZXMuICBQcm9iYWJs
eSBub3QgYW55IG1lYW5pbmdmdWwgCmNvdmVyYWdlIHRoZXJlIGJlY2F1c2UgSSBqdXN0IHRlc3Qg
aW4gUUVNVSwgYnV0IGl0IHNob3VsZCBzaG93IHVwIHNvb24uCgo+Cj4+Cj4+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBSkYyZ1RSeTVlSzczPWQ2czdDVnk5bTlw
QjhwNHJBb01ITTNjWkZ3emc9QXVGN1REQUBtYWlsLmdtYWlsLmNvbS8gWzFdCj4+IEZpeGVzOiBk
YzY2NjdhNGU3ZTMgKCJyaXNjdjogRXh0ZW5kaW5nIGNwdWZlYXR1cmUuYyB0byBkZXRlY3QgVi1l
eHRlbnNpb24iKQo+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+PiAtLS0KPj4gSSdkIGZvcmdvdHRlbiBhYm91dCB0aGlzIHBhdGNo
LCB0aGUgcGxhbiBoYWQgYmVlbiB0byBzaXQgb24gaXQgdW50aWwKPj4gc29tZW9uZSBhY3R1YWxs
eSByZXBvcnRlZCBlbmNvdW50ZXJpbmcgdGhpcywgYnV0IFBhbG1lciBhc2tlZCBtZSB0bwo+PiBy
ZXNlbmQgdGhpcyBhcyBwYXJ0IG9mIHJldml2aW5nIHRoZSBhdHRlbXB0IHRvIG1haW5saW5lIHRo
ZSBiYXNpYwo+PiBzdXBwb3J0IGZvciB2ZWN0b3Igb24gdGhlc2UgZGV2aWNlcy4KPj4KPj4gSSBn
dWVzcyB0aGUgcmlzY3YsaXNhLWV4dGVuc2lvbnMgc3VwcG9ydCBhY3R1YWxseSBsYW5kZWQgYWZ0
ZXIgdGhlIHYyCj4+IHdhcyB3cml0dGVuLCBzbyB2MyBpcyBsZXNzIGNvbXBsaWNhdGVkIHNpbmNl
IHRoZXJlJ3MgZnVsbCBzdXBwb3J0IGZvcgo+PiBwYXJzaW5nIHRoZSBuZXcgcHJvcGVydHkgYW5k
IGFsbCB3ZSBoYXZlIHRvIGRvIGlzIGJsb2NrIFYgaW4gdGhlICFhY3BpCj4+IGNhc2Ugd2hlbiBw
YXJzaW5nIHJpc2N2LGlzYSBub3cuIEFzIEd1byBSZW4gc3VnZ2VzdGVkLCBJIGRlY3JlYXNlZCB0
aGUKPj4gc2l6ZSBvZiB0aGUgaGFtbWVyIGZ1cnRoZXIsIHNvIHRoYXQgdGhlIGM5MDgsIHRoYXQg
ZG9lcyBpbXBsbWVudCB0aGUKPj4gcmF0aWZpZWQgViBleHRlbnNpb24sIGNhbiBzZXQgInYiIGlu
IHJpc2N2LGlzYS4gT3RoZXIgdGhhbiB0aGF0LCB3aGF0Cj4+IGNoYW5nZWQgaXMganVzdCBhIHJl
YmFzZSBvbiB0b3Agb2YgdGhlIGNoYW5nZXMgc2luY2UgSnVseS4gdjIgaXMgaW4gdGhlCj4+IExp
bms6IHRhZyBhYm92ZS4KPj4KPj4gY2M6IGNoYXJsaWVAcml2b3NpbmMuY29tCj4+IGNjOiBjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbQo+PiBjYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBjYzogcGFsbWVyQGRhYmJlbHQuY29tCj4+IGNjOiBndW9yZW5Aa2VybmVsLm9yZwo+
PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDE1ICsrKysrKysrKysr
KysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYwo+PiBpbmRleCA4OTkyMGY4NGQwYTMuLjNhMDVhZjdiZTUxMCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwo+PiBAQCAtMjQsNiArMjQsNyBAQAo+PiAgI2luY2x1ZGUgPGFz
bS9od3Byb2JlLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4+ICAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgo+PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4gICNpbmNsdWRlIDxhc20v
dmVjdG9yLmg+Cj4+Cj4+ICAjaW5jbHVkZSAiY29weS11bmFsaWduZWQuaCIKPj4gQEAgLTUzOCw2
ICs1MzksMjAgQEAgc3RhdGljIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXBfZnJvbV9pc2Ff
c3RyaW5nKHVuc2lnbmVkIGxvbmcgKmlzYTJod2NhcCkKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJSFBNLCBpc2FpbmZvLT5pc2EpOwo+PiAgICAgICAg
ICAgICAgICAgfQo+Pgo+PiArICAgICAgICAgICAgICAgLyoKPj4gKyAgICAgICAgICAgICAgICAq
ICJWIiBpbiBJU0Egc3RyaW5ncyBpcyBhbWJpZ3VvdXMgaW4gcHJhY3RpY2U6IGl0IHNob3VsZCBt
ZWFuCj4+ICsgICAgICAgICAgICAgICAgKiBqdXN0IHRoZSBzdGFuZGFyZCBWLTEuMCBidXQgdmVu
ZG9ycyBhcmVuJ3Qgd2VsbCBiZWhhdmVkLgo+PiArICAgICAgICAgICAgICAgICogTWFueSB2ZW5k
b3JzIHdpdGggVC1IZWFkIENQVSBjb3JlcyB3aGljaCBpbXBsZW1lbnQgdGhlIDAuNy4xCj4+ICsg
ICAgICAgICAgICAgICAgKiB2ZXJzaW9uIG9mIHRoZSB2ZWN0b3Igc3BlY2lmaWNhdGlvbiBwdXQg
InYiIGludG8gdGhlaXIgRFRzLgo+PiArICAgICAgICAgICAgICAgICogQ1BVIGNvcmVzIHdpdGgg
dGhlIHJhdGlmaWVkIHNwZWMgd2lsbCBjb250YWluIG5vbi16ZXJvCj4+ICsgICAgICAgICAgICAg
ICAgKiBtYXJjaGlkLgo+PiArICAgICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAgICAgICBp
ZiAoYWNwaV9kaXNhYmxlZCAmJiByaXNjdl9jYWNoZWRfbXZlbmRvcmlkKGNwdSkgPT0gVEhFQURf
VkVORE9SX0lEICYmCj4+ICsgICAgICAgICAgICAgICAgICAgcmlzY3ZfY2FjaGVkX21hcmNoaWQo
Y3B1KSA9PSAweDApIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgdGhpc19od2NhcCAmPSB+
aXNhMmh3Y2FwW1JJU0NWX0lTQV9FWFRfdl07Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNs
ZWFyX2JpdChSSVNDVl9JU0FfRVhUX3YsIGlzYWluZm8tPmlzYSk7Cj4+ICsgICAgICAgICAgICAg
ICB9Cj4+ICsKPj4gICAgICAgICAgICAgICAgIC8qCj4+ICAgICAgICAgICAgICAgICAgKiBBbGwg
Im9rYXkiIGhhcnQgc2hvdWxkIGhhdmUgc2FtZSBpc2EuIFNldCBIV0NBUCBiYXNlZCBvbgo+PiAg
ICAgICAgICAgICAgICAgICogY29tbW9uIGNhcGFiaWxpdGllcyBvZiBldmVyeSAib2theSIgaGFy
dCwgaW4gY2FzZSB0aGV5IGRvbid0Cj4+IC0tCj4+IDIuNDMuMAo+Pgo+Cj4KPiAtLSAKPiBCZXN0
IFJlZ2FyZHMKPiAgR3VvIFJlbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
