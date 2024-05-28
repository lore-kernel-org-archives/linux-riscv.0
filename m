Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAFAC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S2I20hRyQIEqJb8u6Y4WpD3Ztwlv8bw8w8iYaLkN9w=; b=AxeaaMog/Egyt2
	2besjkL6Zm1ZDTmFUgIRaGpAicqNMg7bZ2C1ZHDQbqIper37vlFsQhYxdORLJ6mCehK4UEqr8kofN
	i/EdO956/WmN13jq8IRKgMXkFYQH6vlVhPt75wF/IQDKYtVrLuB3D6YBpj+Ccc+Xjs/9It2ZdQTmO
	s4UoCCw0rNKQ+5I6bLVhDMV/cYKpGdvs+q7WImUbDrsCtkiuXKvf35n4n1Q4GeS5Fuouhm6ObHTLp
	XaofTZOzdPN3WWNrTLai+hxmZqLyKtuNuGY4kio+TJZDiiH5xD6jcY4aDvMaWZZGb1hRR4tB3FD/B
	8hrTHfmslPS00TBRY3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtrU-00000000AtC-3hOg;
	Tue, 28 May 2024 10:15:20 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtrQ-00000000Arc-3LEK
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 10:15:18 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e95a1e7540so335741fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716891312; x=1717496112; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJo11HxnJz9bNWmT6d/DDh++L1djwhjY6e39n68+9tM=;
        b=pi0Zd/nuXbCHlXRnkPQyoaoI58xj0bOMp1D8dQGC+rHmTGugv9XDfl/n3mDNKtOUev
         cJUZWQgnG3Ua2W3+aVe9G/fznJcHOJSWHCZUQolyuczbuZAFg75jGl6WILHfoGAZ9rX2
         +8dTeo1KGXvLlPd9yDFerETD2uH1qeV3Eo2OQvnSO+ua8lxd44reH7gSQahc4T5GDTH8
         JamYfUAtxUJ5PHexd+nAkPrwNFsKCgVpvCEmRtR5uG3xLHEqsCVbmeOWiPpO4QQZWGG5
         jkcvlPus3qgHMtDC7ua+97iWDo+t0MwdI//qGsIMpodYnmKprq8hQlwIphLOKlX1f3/Y
         TnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716891312; x=1717496112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJo11HxnJz9bNWmT6d/DDh++L1djwhjY6e39n68+9tM=;
        b=YhUSdJzR8lNJnZDUosavGwD8YSVxbbeja4smdwflMMBrh2cN1cAAJH+kfMDKmyly2P
         zYsPMgi4NcYIfvWzYSi3oVg4OEbtRiMcv6bo01rmm2SAdFIWG9DLhvQJi6isEmXwmef4
         +vNodxSPSQW+MwZwM6bmwX6j5KnGawBVyYq3ZjtHGEbfaN5JmdhaUhHKUFpjCxdUybp/
         Q1SZVDcqYibcVcFhLsAgFRtlpRElFlp2rzq9TpmeUkVU9VCwnjaYqcmC1Cg0RJGPSGkc
         5i7ZGZafW6MqflyigceckpU1w/mJlaFPYO1Q9XP6TrW4hF3G4cGZE0epWLZYPCcnpqyS
         cZJw==
X-Forwarded-Encrypted: i=1; AJvYcCWd724saf9HRHaHRudOZfFIU37eAT4xGYps835TTKx+Ifa9bjkrSrQgH5K13shpY8u6e/h6fKNAEoyH/iQ0hqvJpJR76Bln7pUIzb0zt9rG
X-Gm-Message-State: AOJu0YzeA+OzBj7r3haTfCRDEgnrCoZbmch7ecPDC5ApfwxWSxP3pTsv
	7G4i4d4lpgcsn/dhSa7BmX7jykthgzo6zBinV/0OYdP/VCAhTm/vUH1m9P0NXYGK/vVfYphJanA
	DMLs=
X-Google-Smtp-Source: AGHT+IGJQCkm1zvi3G2nkrY7snFxSIlGT1jUS1f8uJE8FtpINZx4K4WXRaEt0TWwggZ5ofXJB3NyLA==
X-Received: by 2002:a05:651c:2106:b0:2de:42d0:faf8 with SMTP id 38308e7fff4ca-2e95b33028cmr80465331fa.5.1716891310532;
        Tue, 28 May 2024 03:15:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:deaf:e457:42a:ab9? ([2a01:e0a:999:a3a0:deaf:e457:42a:ab9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35586a15f56sm11303694f8f.109.2024.05.28.03.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 03:15:10 -0700 (PDT)
Message-ID: <40da6797-faab-41f3-b4bd-766e6a117468@rivosinc.com>
Date: Tue, 28 May 2024 12:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 4/5] RISC-V: KVM: add support for
 SBI_FWFT_PTE_AD_HW_UPDATING
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, alex@ghiti.fr,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-5-yongxuan.wang@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240524103307.2684-5-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_031516_949495_BA032546 
X-CRM114-Status: GOOD (  20.80  )
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

CgpPbiAyNC8wNS8yMDI0IDEyOjMzLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiBBZGQgc3VwcG9y
dCBmb3IgU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HIHRvIHNldCB0aGUgUFRFIEEvRCBiaXRz
Cj4gdXBkYXRpbmcgYmVoYXZpb3IgZm9yIEd1ZXN0L1ZNLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlv
bmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaCB8ICAyICstCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysr
Ky0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKPiBpbmRleCA3
YjdiY2M1YzhmZWUuLjM2MTRhNDRlMGE0YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaV9md2Z0LmgKPiBAQCAtMTEsNyArMTEsNyBAQAo+ICAKPiAgI2luY2x1ZGUg
PGFzbS9zYmkuaD4KPiAgCj4gLSNkZWZpbmUgS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlQJMQo+
ICsjZGVmaW5lIEtWTV9TQklfRldGVF9GRUFUVVJFX0NPVU5UCTIKPiAgCj4gIHN0cnVjdCBrdm1f
c2JpX2Z3ZnRfY29uZmlnOwo+ICBzdHJ1Y3Qga3ZtX3ZjcHU7Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQu
Ywo+IGluZGV4IDg5ZWMyNjNjMjUwZC4uMTRlZjc0MDIzMzQwIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2Z3ZnQuYwo+IEBAIC03MSw2ICs3MSwzNiBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZndmdF9nZXRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgCXJldHVybiBT
QklfU1VDQ0VTUzsKPiAgfQo+ICAKPiArc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfYWR1ZV9zdXBw
b3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKwlpZiAoIXJpc2N2X2lzYV9leHRl
bnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFEVSkpCj4gKwkJcmV0dXJuIFNCSV9F
UlJfTk9UX1NVUFBPUlRFRDsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGlu
dCBrdm1fc2JpX2Z3ZnRfc2V0X2FkdWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3Zt
X3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArCQkJCSB1bnNpZ25lZCBsb25nIHZhbHVlKQo+ICt7
Cj4gKwlpZiAodmFsdWUpCj4gKwkJdmNwdS0+YXJjaC5jZmcuaGVudmNmZyB8PSBFTlZDRkdfQURV
RTsKPiArCWVsc2UKPiArCQl2Y3B1LT5hcmNoLmNmZy5oZW52Y2ZnICY9IH5FTlZDRkdfQURVRTsK
PiArCj4gKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQga3ZtX3Ni
aV9md2Z0X2dldF9hZHVlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9zYmlfZndm
dF9jb25maWcgKmNvbmYsCj4gKwkJCQkgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gK3sKPiArCWlm
ICghcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFNWQURVKSkK
PiArCQlyZXR1cm4gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ICsKPiArCSp2YWx1ZSA9ICEhKHZj
cHUtPmFyY2guY2ZnLmhlbnZjZmcgJiBFTlZDRkdfQURVRSk7Cj4gKwo+ICsJcmV0dXJuIFNCSV9T
VUNDRVNTOwo+ICt9CgpIaSBZb25nLVh1YW4sCgp2Y3B1LT5hcmNoLmNmZy5oZW52Y2ZnIHNlZW1z
IHRvIGJlIHVzZWQgdG8gdXBkYXRlIHRoZSBIRU5WQ0ZHIENTUiAgb25seQpkdXJpbmcgdmNwdV9s
b2FkKCkvdmNwdV9wdXQoKS4gU28gaWYgdGhpcyBleHRlbnNpb24gdXBkYXRlcyBpdCB0aGVyZSBh
bmQKc3RheXMgaW4gdGhlIGV4ZWN1dGlvbiBsb29wIChrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bigp
KSB0aGVuLCBpdCBzZWVtcwpsaWtlIHRoZSBIRU5WQ0ZHIENTUiB3b24ndCBiZSB1cGRhdGVkIGlt
bWVkaWF0ZWx5IGJ1dCBvbiB0aGUgbmV4dAp2Y3B1X2xvYWQoKS4gSXMgdGhlcmUgc29tZXRoaW5n
IEknbSBtaXNzaW5nID8KClRoYW5rcywKCkNsw6ltZW50IEzDqWdlcgoKPiArCj4gIHN0YXRpYyBz
dHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqCj4gIGt2bV9zYmlfZndmdF9nZXRfY29uZmlnKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPiAg
ewo+IEBAIC0xNzcsNyArMjA3LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiAgCQkuc3VwcG9ydGVkID0ga3ZtX3NiaV9md2Z0X21p
c2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQsCj4gIAkJLnNldCA9IGt2bV9zYmlfZndmdF9z
ZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICAJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21p
c2FsaWduZWRfZGVsZWdhdGlvbiwKPiAtCX0KPiArCX0sCj4gKwl7Cj4gKwkJLmlkID0gU0JJX0ZX
RlRfUFRFX0FEX0hXX1VQREFUSU5HLAo+ICsJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfYWR1
ZV9zdXBwb3J0ZWQsCj4gKwkJLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfYWR1ZSwKPiArCQkuZ2V0
ID0ga3ZtX3NiaV9md2Z0X2dldF9hZHVlLAo+ICsJfSwKPiAgfTsKPiAgCj4gIHN0YXRpY19hc3Nl
cnQoQVJSQVlfU0laRShmZWF0dXJlcykgPT0gS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlQpOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
