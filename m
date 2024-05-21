Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B457C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Erg2S+9Iv0Dvv8HNXuL52Stp2I6FI5Tc2F006Mttu4=; b=HFzwQzszecoXPB
	QTo8nkcutkFCz7O0XEnD5W1zO88qpZ2nvOgDayuSB7dr+Xs7i2CNFJbnkS1xHNtuhz2nT6Yph8UpA
	gPga6i1GYQ+3Xau2ovKLWK0YTJ/UTjhpc2Bd5hq86VCI9y6iguGoX2hmy2jB+gzG3+IDBh/pVfKms
	DB9nxG4dd/TSD+aPwHTrZj11m0c1b/hGaryikoNVfbT3z6Y1WmDDAudICAKB2rMX5NZXdu2sacbiX
	8BddzKHatV/ehnODFtFKsFN7NdclQREys2wEdi5n1rjcRpSPyHNaLi4mBTQCTP31nOJd7FiD71APF
	oR2L/8iu5VnH5YEoxeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KOJ-0000000Gh2u-2xJH;
	Tue, 21 May 2024 07:58:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KOE-0000000Ggzw-05pW
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 07:58:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-34cb27f1f2dso84965f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716278307; x=1716883107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBb6iShuxHaV7v6bJv2LipIX1/0KjJPEPWALv2DbLcM=;
        b=kNV4S7CzgzmgIbNn7a4vmgxGsnewFr5M4lyOIL4e9QjFHWzsCYQ5upEfFwScOHnZOQ
         zGLDSJmTVFSO5sVVAf0Jzuiq69Mr7DXg/bKw4nMxshtHrFnMP48r0Un6zCukbC/2CbCc
         zbdSuhFYMGqZkVFBrHnC8LBiZ8irhJ9s1HM2wiZ9qJSx69ARurkwuF9DgwsdLewjBdC6
         AqW5jJfpeAbBP9w8jV6orXwQtRJlEC7+DyErvg0H+9ItKBW8hhgrt2fvvyRW91XIE7W2
         VQTXT9XTcOwhP7KT2Ik2IaSJiJaPv2GPzdTk/z6EiHv2o2xforNdOjDud++sobu1lB9i
         YB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278307; x=1716883107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBb6iShuxHaV7v6bJv2LipIX1/0KjJPEPWALv2DbLcM=;
        b=Mi61gs6ikFQUB7cazw92VmxfNWuLxdnBOlu5i/WILKWJGjioX6nnlStuixXT1zPY5x
         Q9k5l34r6X+XRnBloHSgACQIGXSEhckkLR36pca78LqpaH1TiLrslnnHjXSNLXM513rR
         Q0bQm64FoJf7yi1coa6nc52V//sEUEiRpe8jRp8w/ESuWRW5NXXuUQfM/D6mamPSPAPE
         2t24FNpnpbVFF3BVezZYB95JyDIdL+TANbYWkntuBEuZwFKNihuenfimv8RZj/3huvSQ
         7TxVlL65mW0ecOW3DsyFJr4uU7SD2omiE32Z4Ynm5s/XQwgXUkBDO3moUiNKUUjuYGe+
         sJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFnqdMhdtm2k8lHV13Gd5K4G+JSOsK/G1B0lcY68KfVj5rW9mtPt0a/mwsxx3rJZX9DJxtYz2UX7ypmDSM/ycEMm1/3pecSgem6PMZDPAs
X-Gm-Message-State: AOJu0Yw980MEihO/jMgxzBdUoiLUwdFFRYi8rtzbJYjdNN1TnQM5BGLw
	YOdzqALikin6XRBwWWR7fjoTsuc+IMTiivM5sXxWQoLeN2gFjgQlUwFOgcgasgI=
X-Google-Smtp-Source: AGHT+IHfRRdzTlFAebZ7wRlj20qZMeakja/n64TG1vwKypRDd/Ir6iJk3WrsYiVjjhgxZ9RFdOvn+A==
X-Received: by 2002:adf:eed1:0:b0:34d:7201:460a with SMTP id ffacd0b85a97d-3504a10f308mr21256806f8f.0.1716278307420;
        Tue, 21 May 2024 00:58:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:813a:5863:97f7:aca7? ([2a01:e0a:999:a3a0:813a:5863:97f7:aca7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbefdsm31017829f8f.94.2024.05.21.00.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 00:58:26 -0700 (PDT)
Message-ID: <6d2eb1ec-010d-4390-a25e-afd2fca0311d@rivosinc.com>
Date: Tue, 21 May 2024 09:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] riscv: add ISA extensions validation callback
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-8-cleger@rivosinc.com>
 <20240517-scrunch-palace-2f83aa8cc3ce@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240517-scrunch-palace-2f83aa8cc3ce@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_005830_242971_4779C0BF 
X-CRM114-Status: GOOD (  14.02  )
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

CgpPbiAxNy8wNS8yMDI0IDE4OjQ0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MTcsIDIwMjQgYXQgMDQ6NTI6NDdQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBT
aW5jZSBhIGZldyBleHRlbnNpb25zIChaaWNib20vWmljYm96KSBhbHJlYWR5IG5lZWRzIHZhbGlk
YXRpb24gYW5kCj4+IGZ1dHVyZSBvbmVzIHdpbGwgbmVlZCBpdCBhcyB3ZWxsIChaYyopIGFkZCBh
IHZhbGlkYXRlKCkgY2FsbGJhY2sgdG8KPj4gc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YS4gVGhp
cyByZXF1aXJlIHRvIHJld29yayB0aGUgd2F5IGV4dGVuc2lvbnMgYXJlCj4+IHBhcnNlZCBhbmQg
c3BsaXQgaXQgaW4gdHdvIHBoYXNlcy4gRmlyc3QgcGhhc2UgaXMgaXNhIHN0cmluZyBvciBpc2EK
Pj4gZXh0ZW5zaW9uIGxpc3QgcGFyc2luZyBhbmQgY29uc2lzdHMgaW4gZW5hYmxpbmcgYWxsIHRo
ZSBleHRlbnNpb25zIGluIGEKPj4gdGVtcG9yYXJ5IGJpdG1hc2sgKHNvdXJjZSBpc2EpIHdpdGhv
dXQgYW55IHZhbGlkYXRpb24uIFRoZSBzZWNvbmQgc3RlcAo+PiAicmVzb2x2ZXMiIHRoZSBmaW5h
bCBpc2EgYml0bWFwLCBoYW5kbGluZyBwb3RlbnRpYWwgbWlzc2luZyBkZXBlbmRlbmNpZXMuCj4+
IFRoZSBtZWNoYW5pc20gaXMgcXVpdGUgc2ltcGxlIGFuZCBzaW1wbHkgdmFsaWRhdGUgZWFjaCBl
eHRlbnNpb24KPj4gZGVzY3JpYmVkIGluIHRoZSBzb3VyY2UgYml0bWFwIGJlZm9yZSBlbmFibGlu
ZyBpdCBpbiB0aGUgcmVzb2x2ZWQgaXNhCj4+IGJpdG1hcC4gdmFsaWRhdGUoKSBjYWxsYmFja3Mg
Y2FuIHJldHVybiBlaXRoZXIgMCBmb3Igc3VjY2VzcywKPj4gLUVQUk9CRURFRkVSIGlmIGV4dGVu
c2lvbiBuZWVkcyB0byBiZSB2YWxpZGF0ZWQgYWdhaW4gYXQgbmV4dCBsb29wLiBBCj4+IHByZXZp
b3VzIElTQSBiaXRtYXAgaXMga2VwdCB0byBhdm9pZCBsb29waW5nIG11bHRpcGxlIHRpbWVzIGlm
IGFuCj4+IGV4dGVuc2lvbiBkZXBlbmRlbmNpZXMgYXJlIG5ldmVyIHNhdGlzZmllZCB1bnRpbCB3
ZSByZWFjaCBhIHN0YWJsZQo+PiBzdGF0ZS4gSW4gb3JkZXIgdG8gYXZvaWQgYW55IHBvdGVudGlh
bCBpbmZpbml0ZSBsb29waW5nLCBhbGxvdyBsb29waW5nCj4+IGEgbWF4aW11bSBvZiB0aGUgbnVt
YmVyIG9mIGV4dGVuc2lvbiB3ZSBoYW5kbGUuIFppY2JveiBhbmQgWmljYm9tCj4+IGV4dGVuc2lv
bnMgYXJlIG1vZGlmaWVkIHRvIHVzZSB0aGlzIHZhbGlkYXRpb24gbWVjaGFuaXNtLgo+IAo+IEkg
d2lzaCB3ZSB3ZXJlbid0IGRvaW4nIGl0IGF0IGFsbCwgYnV0IHNpbmNlIHdlIGhhdmUgdG8sIEkg
dGhpbmsgd2hhdAo+IHlvdSd2ZSBnb3QgaGVyZSBpcyBnb29kLgoKWXVwLCB0aGlzIGlzIHdoYXQg
eW91IGdvdCB3aXRoIGEgZmFzdCBldm9sdmluZyBhcmNoaXRlY3R1cmUgSSBndWVzcyA7KQoKPiBS
ZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAK
PiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIHNvbWUgcGF0Y2hlcyBmb3IgdGhlIEYvViBzdHVmZiB3
ZSBkaXNjdXNzZWQKPiBwcmV2aW91c2x5PwoKU3VyZSBnbyBhaGVhZCwgSSBkaWQgbm90IGhhdmUg
YW55dGhpbmcgd3JpdHRlbiB5ZXQuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBDaGVlcnMsCj4g
Q29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
