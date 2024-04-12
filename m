Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B9CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnSGDrPeX4EM3yFHtEXj+FW78TuSykA/3ZELTOkhluU=; b=c8cGe2pO/QlXkh
	KnGohJOOBFd7DkAej0FLvAaBuABElgDcdv3UrRBZ611nZOT4hWGiNcW2S2+q87JOa68FLSGnCpX1R
	8eBjKQg5SXeH/KQZZiI2EOCgw/OC4allGwvqtcyvJupF4oscECv3DsyZboc/i9R9bDeqn0GYW1d/z
	D7sXIhA6TCLebkuFdcwfkUBwVJSXZKr4NL4oMjXtMmYxYgTgEX9q1JFnUWb1bbdryqLXOIEur0HMy
	zOODBgdsGmUU9lOq5n55abaMwguDVJhzt4K6azDwc4YEvkIpl+0rdMIJNxd1JTed8IOCmcUDE1060
	3vyzd+zr7mRY5+swmysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLuz-00000000vnu-31P3;
	Fri, 12 Apr 2024 18:46:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLuu-00000000vl5-1JjI
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 18:46:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e5ebb30129so468565ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712947586; x=1713552386; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jhdmuDh97ehxPhYQBh/JW7pvCSTVsjtJJK5Y5QDdmM8=;
        b=Nr0X0aAEoloxjh4canaJw6xe3dE3arHYsKB3aT2VFefFfZvc1PeE486tJYedKMnoN9
         rKVDmFLgjf+/tYImp1V9lW2X1ryC4NRc1xUln46c+0jtxOgzivmyRHYC6ROG6k4n/NI4
         3QWqBh0yaL/rOB/IHARsbqbWq2EXelggvmAOr3iFydNm22lvbVtaK/ZWHcEVa9Fic30/
         hPlpKpA70pJKCShhf5ORLG7S+sETsms7/fksVS/XftIEWGv2JILRYrEL7mQm7x84fSzX
         3ACn/JZro/mX5+cskSRaF74kFSGbblk3hUG4ySRaa7bLL35hAMvYjy4gvo0CODms+uoq
         mzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712947586; x=1713552386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhdmuDh97ehxPhYQBh/JW7pvCSTVsjtJJK5Y5QDdmM8=;
        b=U0f8potmOqUxb19LlzlTzmn6Zi+IE8YHlu8pMuSpTIuucaFhYfNlz6PzGmBEgIV9Q0
         sUC43TEdPLG5Gs5wZQf56ZPx5Gpd/0ajEp3rIVzhqK2aiJjzfclQIwH3wv8oLvu+zZSX
         6qgqsMEMqJw8bWmxhMy01MU9BSRGzI+cpgqKz19R3cwPPcPfu43a7XtgH1NDMpUipdY2
         DdTvEaj4TU4iFQfc80/Rpt9NdLZlkAw/QolgXSumVQQy6acz7jtPHSLrnkjo5WHAQLSM
         d1/AhibDpmDO0krmpWL7rh/ZqHYE1XhJal7AE5PsbehvAf2DRQ7eO3k6Dmfr5J5frLeY
         xc7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvGl0CsZ1TT4BpHgppHAwp5pciG8R7F4hk1jmr3v6yU8yGx9i94gCfNH1aUqlIgESmJVZrv6m0GAsanMtr80+cQ7NAIwQZFyOZ8k7OSkcF
X-Gm-Message-State: AOJu0Yytx+uD/m3FxZBblTLm7k6PdB8BHlV4VJgJR//UvZqN0KEVazCg
	7E/qhyQ1UwUhqw2LTS9rOmed+6UwgTYBDxFkieKlkawuHFbgSwLFCMVNR46W1J0=
X-Google-Smtp-Source: AGHT+IFwxybYzCqREDQlA4G/991sEd0Qsau4lgiSO1q7Go2BFR9+aFqtd2m1c15qUgSnxQTpows9RQ==
X-Received: by 2002:a17:903:8ce:b0:1e4:70d0:9333 with SMTP id lk14-20020a17090308ce00b001e470d09333mr4440423plb.9.1712947586221;
        Fri, 12 Apr 2024 11:46:26 -0700 (PDT)
Received: from ghost ([107.84.152.28])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090322c200b001e447bf336esm3300373plg.282.2024.04.12.11.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:46:25 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:46:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZhmBfaKXMMtolwSr@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
 <20240412-employer-crier-c201704d22e3@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-employer-crier-c201704d22e3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_114628_617108_6E522F94 
X-CRM114-Status: GOOD (  32.63  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMDc6Mzg6MDRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgQXByIDEyLCAyMDI0IGF0IDEwOjA0OjE3QU0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCAzOjI24oCvQU0gQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRo
dSwgQXByIDExLCAyMDI0IGF0IDA5OjExOjA4UE0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90
ZToKPiA+ID4gPiBUaGUgcmlzY3ZfY3B1aW5mbyBzdHJ1Y3QgdGhhdCBjb250YWlucyBtdmVuZG9y
aWQgYW5kIG1hcmNoaWQgaXMgbm90Cj4gPiA+ID4gcG9wdWxhdGVkIHVudGlsIGFsbCBoYXJ0cyBh
cmUgYm9vdGVkIHdoaWNoIGhhcHBlbnMgYWZ0ZXIgdGhlIERUIHBhcnNpbmcuCj4gPiA+ID4gVXNl
IHRoZSB2ZW5kb3JpZC9hcmNoaWQgdmFsdWVzIGZyb20gdGhlIERUIGlmIGF2YWlsYWJsZSBvciBh
c3N1bWUgYWxsCj4gPiA+ID4gaGFydHMgaGF2ZSB0aGUgc2FtZSB2YWx1ZXMgYXMgdGhlIGJvb3Qg
aGFydCBhcyBhIGZhbGxiYWNrLgo+ID4gPiA+Cj4gPiA+ID4gRml4ZXM6IGQ4MmYzMjIwMmUwZCAo
IlJJU0MtVjogSWdub3JlIFYgZnJvbSB0aGUgcmlzY3YsaXNhIERUIHByb3BlcnR5IG9uIG9sZGVy
IFQtSGVhZCBDUFVzIikKPiA+ID4KPiA+ID4gSWYgdGhpcyBpcyBvdXIgb25seSB1c2UgY2FzZSBm
b3IgZ2V0dGluZyB0aGUgbXZlbmRvcmlkL21hcmNoaWQgc3R1ZmYKPiA+ID4gZnJvbSBkdCwgdGhl
biBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBhZGQgaXQuIE5vbmUgb2YgdGhlIGRldmljZXRyZWVz
Cj4gPiA+IHRoYXQgdGhlIGNvbW1pdCB5b3UncmUgZml4aW5nIGhlcmUgYWRkcmVzc2VzIHdpbGwg
aGF2ZSB0aGVzZSBwcm9wZXJ0aWVzCj4gPiA+IGFuZCBpZiB0aGV5IGRpZCBoYXZlIHRoZW0sIHRo
ZXknZCB0aGVuIGFsc28gYmUgbmV3IGVub3VnaCB0byBob3BlZnVsbHkKPiA+ID4gbm90IGhhdmUg
InYiIGVpdGhlciAtIHRoZSBpc3N1ZSBpcyB0aGV5J3JlIHVzaW5nIHdoYXRldmVyIGNyYXAgdGhl
Cj4gPiA+IHZlbmRvciBzaGlwcGVkLgo+ID4gPiBJZiB3ZSdyZSBnb25uYSBnZXQgdGhlIGluZm9y
bWF0aW9uIGZyb20gRFQsIHdlIGFscmVhZHkgaGF2ZSBzb21ldGhpbmcKPiA+ID4gdGhhdCB3ZSBj
YW4gbG9vayBhdCB0byBwZXJmb3JtIHRoZSBkaXNhYmxlIGFzIHRoZSBjcHUgY29tcGF0aWJsZXMg
Z2l2ZQo+ID4gPiB1cyBlbm91Z2ggaW5mb3JtYXRpb24gdG8gbWFrZSB0aGUgZGVjaXNpb24uCj4g
PiA+Cj4gPiA+IEkgYWxzbyB0aGluayB0aGF0IHdlIGNvdWxkIGp1c3QgY2FjaGUgdGhlIGJvb3Qg
Q1BVJ3MgbWFyY2hpZC9tdmVuZG9yaWQsCj4gPiA+IHNpbmNlIHdlIGFscmVhZHkgaGF2ZSB0byBs
b29rIGF0IGl0IGluIHJpc2N2X2ZpbGxfY3B1X21mcl9pbmZvKCksIGF2b2lkCj4gPiA+IHJlcGVh
dGluZyB0aGVzZSBlY2FsbHMgb24gYWxsIHN5c3RlbXMuCj4gPiA+Cj4gPiA+IFBlcmhhcHMgZm9y
IG5vdyB3ZSBjb3VsZCBqdXN0IGxvb2sgYXQgdGhlIGJvb3QgQ1BVIGFsb25lPyBUbyBteQo+ID4g
PiBrbm93bGVkZ2UgdGhlIHN5c3RlbXMgdGhhdCB0aGlzIHRhcmdldHMgYWxsIGhhdmUgaG9tb2dl
bmVvdXMKPiA+ID4gbWFyY2hpZC9tdmVuZG9yaWQgdmFsdWVzIG9mIDB4MC4KPiA+IAo+ID4gSXQn
cyBwb3NzaWJsZSBJJ20gbWlzaW50ZXJwcmV0aW5nLCBidXQgaXMgdGhlIHN1Z2dlc3Rpb24gdG8g
YXBwbHkgdGhlCj4gPiBtYXJjaGlkL212ZW5kb3JpZCB3ZSBmaW5kIG9uIHRoZSBib290IENQVSBh
bmQgYXNzdW1lIGl0J3MgdGhlIHNhbWUgb24KPiA+IGFsbCBvdGhlciBDUFVzPyBTaW5jZSB3ZSdy
ZSByZXBvcnRpbmcgdGhlIG1hcmNoaWQvbXZlbmRvcmlkL21pbXBpZCB0bwo+ID4gdXNlcm1vZGUg
aW4gYSBwZXItaGFydCB3YXksIGl0IHdvdWxkIGJlIGJldHRlciBJTU8gaWYgd2UgcmVhbGx5IGRv
Cj4gPiBxdWVyeSBtYXJjaGlkL212ZW5kb3JpZC9taW1waWQgb24gZWFjaCBoYXJ0LiBUaGUgcHJv
YmxlbSB3aXRoIGFwcGx5aW5nCj4gPiB0aGUgYm9vdCBDUFUncyB2YWx1ZSBldmVyeXdoZXJlIGlz
IGlmIHdlJ3JlIGV2ZXIgd3JvbmcgaW4gdGhlIGZ1dHVyZQo+ID4gKGllIHRoYXQgYXNzdW1wdGlv
biBkb2Vzbid0IGhvbGQgb24gc29tZSBtYWNoaW5lKSwgd2UnbGwgb25seSBmaW5kIG91dAo+ID4g
YWJvdXQgaXQgYWZ0ZXIgdGhlIGZhY3QuIFNpbmNlIHdlIHJlcG9ydGVkIHRoZSB3cm9uZyBpbmZv
cm1hdGlvbiB0bwo+ID4gdXNlcm1vZGUgdmlhIGh3cHJvYmUsIGl0J2xsIGJlIGFuIHVnbHkgdXNl
cnNwYWNlIEFCSSBpc3N1ZSB0byBjbGVhbgo+ID4gdXAuCj4gCj4gWW91J3JlIG1pc2ludGVycHJl
dGluZywgd2UgZG8gZ2V0IHRoZSB2YWx1ZXMgb24gYWxsIGluZGl2aWR1YWxseSBhcwo+IHRoZXkn
cmUgYnJvdWdodCBvbmxpbmUuIFRoaXMgaXMgb25seSB1c2VkIGJ5IHRoZSBjb2RlIHRoYXQgdGhy
b3dzIGEgYm9uZQo+IHRvIHBlb3BsZSB3aXRoIGNyYXBweSB2ZW5kb3IgZHRicyB0aGF0IHB1dCAi
diIgaW4gcmlzY3YsaXNhIHdoZW4gdGhleQo+IHN1cHBvcnQgdGhlIHVucmF0aWZpZWQgdmVyc2lv
bi4KCk5vdCBxdWl0ZSwgdGhlIGFsdGVybmF0aXZlcyBhcmUgcGF0Y2hlZCBiZWZvcmUgdGhlIG90
aGVyIGNwdXMgYXJlCmJvb3RlZCwgc28gdGhlIGFsdGVybmF0aXZlcyB3aWxsIGhhdmUgZmFsc2Ug
cG9zaXRpdmVzIHJlc3VsdGluZyBpbgpicm9rZW4ga2VybmVscy4KCi0gQ2hhcmxpZQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
