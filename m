Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE82606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ys22jEZz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XUiaaXN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T4I8+birJSNg65SYSAd2nWap0jVMDlKbUXqfBQPVRBM=; b=Ys22jEZzYcJz6AK0DcISZoWXg/
	1gOffwW7jimVoLtv8ZIv8ofPEVYfXR/+Dos2DF0lfZY0RkR1oqR0XegLaquoi5G+M+zfANIdcu//v
	lBkJFixNxZIOBwnHBTyul2ut4x9mAGrPy7wI8BtsP7bvyvMdC/eBM5uFyQoEUPnFFJJuCKD2zd8Tr
	cVwaYug+QeJ1Y3l1SfzgoKrpiC6bJ2B+VsXpBae2JM3A6B1b6tZim6MySOrSaOj7vwcDeuhGUERUQ
	dzGHZKJFPWYFT/RhV3AMEBL4iHF6ssMTF3weUkxWOWl4FT9Cnr8QlYhQE3KWjq8qHDetJak1xrib+
	mgXPCgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzse-0000000BdMK-3Z67;
	Thu, 19 Nov 2026 11:00:40 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzsb-0000000BdJV-34V7
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 11:00:39 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-862d919fb1cso1198483a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 03:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795086034; cv=none;
        d=google.com; s=arc-20260327;
        b=YM35MBPmBq9OkElWY6GXT6adjYWmxbiZnzepijYwcMBhKT6Q3nyPzF1kkXfTHw6nI1
         7UvNjydpXy2+NiY8WqHeCRbhTg508zc+fv8038ofAtu8ff8Kuen68Q05Cj0nuwZQHBDz
         sH/TXcy39i0qLGMz2FIoLMw8/l20NV4arf+HhI5sTxBsnOnpKcguDs2vieovyHBeVqJp
         xse6Qo7QstQQ6t1kNeONUcE0k7havj3huxbvNq6eBR1i6gEQAxw/mgk763bd78oQmdo3
         QMv+TmNV8bmp2L2qA/WyPKWRU2CYo/RY5CA/jXeemGAx7T43QCL2rOS4IVlqkEy1r80g
         wiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        fh=6kLOPLDBlxyjUYSTCHT5fmHT2EKK3Fz6jaU1FMcUJcs=;
        b=iPgs7OVV0Oy1ji+5j/XPRLsUS2evAO5CzNns/76MBj0XDf7NZHdp+mcw05HqK/boao
         WCGRv8NuVpq2CHdxKj/fCXEkaM/A+2nZPsmsIiAMDxLl7q2t63szNGNV8aGCKpsqMZa8
         ggZd8peM5cKDok7fOse6gKo5DhPvBv3ExE75dRWRstF+MEOiVAbO4AvUyIUV3j0wu4wU
         P84BPHw07vO1gkNGtb3gdCc6OR7MFniq8kNSE3ajzFVG34lRYkd+Im3dljp/9wGzjaTJ
         JipGHKdN0IBvyZCWJ+3PZiqDvqECpLoIF5rWtRaNdSqqmiefbGfLPHJaqzDEpFY529lJ
         IiRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795086034; x=1795690834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        b=XUiaaXN8y36yWGrm1wqfBLDoPghuZv3lL8PvJ2k81XBenz/VHqFSZFsJIqSYuh1yFL
         XTtYHwddWoHkur3hk+WzG5KTsnzcn6jY5oG2fyfT92ViY5KapezcBOUFSsSLZ/pkiTMk
         U0cGO2/FjR+XSPzE8AS+8ug0MZTe3G1YelmyG8Sv7U2YN8Itg1d9mYo55S7jLJNZxDW9
         adqfhNl43fOGeNpDmYzwIidkMvISzql7OwtN2c9tYB76Yf/OWRLq4FmVsL9keprRvxQD
         TTlSSpc5TbvwWJdnDUalu7SfSRB4DgajVtaocbYugTESlUFhPeAWOXfITVAUsC+jLKWO
         wf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086034; x=1795690834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6y1X7YxgT/qvetOjdraVACUP5Jk6TwGLYcodl3QDzo=;
        b=V4w25aKx1oQw3G7xF4Xu/wSjTBz6jMcR3VT1LUU+ByBU2lp64e3Xi8NvpTsfJH/Q21
         1DptCQnwuIg+zRUSBBRi343C3PdIx+arAeMaoF9usMNKrK4KUB/EdLJaqffY5GENyYZ2
         6G2Xcdhox19sXGlRNKth70xgX50xDeZ+W7cKKA5whXi19hgpw4NP3nqqw7qt9R/UUT55
         4fg6PZ7vDDt2DkT3DYbKypyBvvyKB6VH12/Jm+DexW4brNC08yQNi4g9ekvMGjaqlHod
         +8qtEaeZOUAvMHm4X8IFJLw5mDgSJE6e8G81BGuZCoCogjhPUnEJy8abrjp33uaBy78m
         5qfA==
X-Forwarded-Encrypted: i=1; AL+hErHVDhUKQMHiZWFXOV3XUKPTwU8vrioMsru9zXcpNiHGAWPipeKBl4Jyr281ranhsoJPioeUsMVVjsKB1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+r9hnRsSSVBvk2u6xTH9qdXfVnvKY6exXmaAOm4ViaxLlwTYjj
	LJld4fimclGxkA7cI5EsnCj2mXR1awqV5TMjM/PlDDWgdSDlWV13ui56SKDuzgHgsQp9DyyOZR9
	AUQ2z5kQGvzBOayejcHZ8apyeIBdXXULZktSn/gYqjw==
X-Gm-Gg: AYBFou0FywcFPmQsDxuY6IwJAA3MEVQrO0k2OfFTbmh2Dhxgg+jyHwU25ucGIr+E1Nw
	fu8OXFdjlpQAD/1jPDAGGq6AtJeeV/42hIYpTgcHG5HpFzYtYxIsKtXRAfhcSRHbCbLp7k64/cr
	5Y8WeJE8OB/Y39Tj8kJnSb2dyFMVOh/tnUmEAqJ9jbI5W3NE+P61EVlE4WRMrqWPrTRM0vHX8t7
	PdFw1O0BZjOyAXNFAVOcaPD3uKAYITWIR4Y7e3OJ9xOAB+KSH7HLx8AUFDCej4g2zPA8W9G48C1
	Q/8OHIR8/FULDosXiJ6Q4fiZS+CKJGaYEcU78Ex/HdFNxZu6d74gMEspLFUaUxlnVTuOdf3BWwE
	/MDAmWhUMFv7a0cExp7OzwNPEJfqiV3DeRrA2iNPi7xU=
X-Received: by 2002:a05:6830:2549:b0:85d:4ed7:1caa with SMTP id
 46e09a7af769-862f08cd866mr8439412a34.29.1795086033987; Thu, 19 Nov 2026
 03:00:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org> <20261119000846.776930b3@jic23-hlaptop>
In-Reply-To: <20261119000846.776930b3@jic23-hlaptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 19 Nov 2026 19:00:21 +0800
X-Gm-Features: AclHuK-ZS4CtfVSYoecAopleoJOI4rSJiggklncDsYMDaJRN7z2tsew2GDgMPx0
Message-ID: <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Jonathan Cameron <jic23@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_030037_804626_AD5F5C3A 
X-CRM114-Status: GOOD (  36.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRHJldywKCk9uIFRodSwgTm92IDE5LCAyMDI2IGF0IDg6MDnigK9BTSBKb25hdGhhbiBDYW1l
cm9uIDxqaWMyM0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgMTQgTm92IDIwMjYgMTQ6
MDY6MjEgLTA4MDAKPiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiA+IEFkZCB0aGUgY29yZSBmb3IgUklTQy1WIENCUVJJIGNhcGFjaXR5IGNvbnRyb2xsZXJzOiB0
aGUgcmVnaXN0ZXIKPiA+IGxheW91dCwgdGhlIGNhcGFiaWxpdHkgcHJvYmUsIGFuZCB0aGUgYWxs
b2NhdGlvbiBvcGVyYXRpb25zIHRoYXQKPiA+IHByb2dyYW0gYSBjYXBhY2l0eSBibG9jayBtYXNr
IGZvciBhbiBSQ0lEIGFuZCByZWFkIGl0IGJhY2suCj4gPgo+ID4gQSBkaXNjb3ZlcnkgbGF5ZXIg
bWFwcyB0aGUgcmVnaXN0ZXIgYmxvY2sgYW5kIGRlc2NyaWJlcyB0aGUgY29udHJvbGxlcgo+ID4g
aW4gYSBjYnFyaV9jb250cm9sbGVyX2luZm8gZGVzY3JpcHRvci4gcmlzY3ZfY2JxcmlfcmVnaXN0
ZXJfY2MoKSBwcm9iZXMKPiA+IHRoZSBjb250cm9sbGVyIGZyb20gdGhhdCBkZXNjcmlwdG9yIGFu
ZCBhZGRzIGl0IHRvIHRoZSBjb250cm9sbGVyIGxpc3QsCj4gPiB3aGljaCBzdGF5cyBwcml2YXRl
IHRvIHRoZSBjb3JlLiBUaGUgY29yZSBvd25zIHRoZSBjb250cm9sbGVyIHN0YXRlCj4gPiBhZnRl
ciByZWdpc3RyYXRpb24sIHNvIG5vdGhpbmcgaW4gaXQgZGVwZW5kcyBvbiBob3cgdGhlIGNvbnRy
b2xsZXIgd2FzCj4gPiBkaXNjb3ZlcmVkLiBUaGUgY2FsbGVyIGtlZXBzIHRoZSByZWdpc3RlciBt
YXBwaW5nIGFsaXZlLgo+ID4KPiA+IFRlc3RlZC1ieTogWmVuZyBIZW5nIDx6ZW5naGVuZ0BwaWNv
aGVhcnQuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmdAcGljb2hlYXJ0
LmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBi
YXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lh
cmRpQGJheWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPgo+Cj4gQSBjb3VwbGUgbW9yZSBkcml2ZSBieSBjb21tZW50cy4KPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9kZXZpY2VzLmMgYi9kcml2ZXJzL3Jl
c2N0cmwvY2JxcmlfZGV2aWNlcy5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi41NTIyODcyZjVjYzEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2Ry
aXZlcnMvcmVzY3RybC9jYnFyaV9kZXZpY2VzLmMKPgo+Cj4gPiArCj4gPiArLyogUmVhZCB0aGUg
Y29uZmlndXJlZCBDQk0gZm9yIGNsb3NpZCBvbiB0aGUgQVQgaGFsZiB2aWEgUkVBRF9MSU1JVC4g
Ki8KPiA+ICtpbnQgY2JxcmlfcmVhZF9jYWNoZV9jb25maWcoc3RydWN0IGNicXJpX2NvbnRyb2xs
ZXIgKmN0cmwsIHUzMiBjbG9zaWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBh
dCwgdTMyICpjYm1fb3V0KQo+ID4gK3sKPiA+ICsgICAgIGludCBlcnI7Cj4gPiArCj4gPiArICAg
ICBndWFyZChtdXRleCkoJmN0cmwtPmxvY2spOwo+ID4gKwo+ID4gKyAgICAgZXJyID0gY2Jxcmlf
Y2NfYWxsb2Nfb3AoY3RybCwgQ0JRUklfQ0NfQUxMT0NfQ1RMX09QX1JFQURfTElNSVQsIGNsb3Np
ZCwgYXQsIDApOwo+ID4gKyAgICAgaWYgKGVyciA9PSAwKSB7Cj4gPiArICAgICAgICAgICAgIC8q
Cj4gPiArICAgICAgICAgICAgICAqIHJlc2N0cmwgZXhwb3NlcyB0aGUgQ0JNIGFzIGEgdTMyIGFu
ZCBjYnFyaV9wcm9iZV9jYygpIHJlamVjdHMKPiA+ICsgICAgICAgICAgICAgICogbmNibGtzID4g
MzIsIHNvIHRoZSBtYXNrIGZpdHMgdGhlIGxvdyAzMi1iaXQgd29yZCBvZiB0aGUKPiA+ICsgICAg
ICAgICAgICAgICogY2NfYmxvY2tfbWFzayByZWdpc3Rlci4KPiA+ICsgICAgICAgICAgICAgICov
Cj4gPiArICAgICAgICAgICAgICpjYm1fb3V0ID0gcmVhZGwoY3RybC0+YmFzZSArIENCUVJJX0ND
X0JMT0NLX01BU0tfT0ZGKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiBlcnI7
Cj4gVW5sZXNzIHRoaXMgZ2V0cyBtb3JlIGNvbXBsZXggaW4gbGF0ZXIgcGF0Y2hlcyBJJ2QgZG8K
PiAgICAgICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4KPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiByZXNjdHJsIGV4cG9zZXMgdGhlIENCTSBhcyBhIHUzMiBhbmQg
Y2JxcmlfcHJvYmVfY2MoKSByZWplY3RzCj4gICAgICAgICAgKiBuY2Jsa3MgPiAzMiwgc28gdGhl
IG1hc2sgZml0cyB0aGUgbG93IDMyLWJpdCB3b3JkIG9mIHRoZQo+ICAgICAgICAgICogY2NfYmxv
Y2tfbWFzayByZWdpc3Rlci4KPiAgICAgICAgICAqLwo+ICAgICAgICAgKmNibV9vdXQgPSByZWFk
bChjdHJsLT5iYXNlICsgQ0JRUklfQ0NfQkxPQ0tfTUFTS19PRkYpOwo+Cj4gICAgICAgICByZXR1
cm4gMDsKPgo+IEp1c3QgdG8ga2VlcCBlcnJvciBoYW5kbGluZyBvdXQgb2YgbGluZSBhbmQgdGhh
dAo+IGNvbW1lbnQgYmxvY2sgbGVzcyBpbmRlbnRlZC4KPgo+ID4gK30KPgo+Cj4gPiArLyoqCj4g
PiArICogcmlzY3ZfY2JxcmlfcmVnaXN0ZXJfY2MoKSAtIHJlZ2lzdGVyIGEgY2FwYWNpdHkgY29u
dHJvbGxlcgo+ID4gKyAqIEBpbmZvOiByZWdpc3RyYXRpb24gZGVzY3JpcHRvci4gaW5mby0+dHlw
ZSBtdXN0IGJlIENBUEFDSVRZLiBUaGUgcmVzY3RybAo+ID4gKyAqICAgICAgICBnbHVlIG1hcHMg
aW5mby0+Y2FjaGVfbGV2ZWwgdG8gdGhlIEwyL0wzIHJlc291cmNlIGFuZCB1c2VzCj4gPiArICog
ICAgICAgIGluZm8tPmNhY2hlX2lkIGFzIHRoZSBkb21haW4gaWQuCj4gPiArICoKPiA+ICsgKiBU
aGUgY2FsbGVyIHJlc29sdmVzIHRoZSBjYWNoZSBsZXZlbCBhbmQgaWQgZnJvbSBpdHMgZmlybXdh
cmUgZGVzY3JpcHRpb24uCj4gPiArICogRG9tYWluIG1lbWJlcnNoaXAgaXMgcmVzb2x2ZWQgcGVy
IENQVSBhdCBob3RwbHVnLCBzbyBubyBjcHUgbWFzayBpcyBzdG9yZWQuCj4gPiArICoKPiA+ICsg
KiBSZXR1cm46IDAgb24gc3VjY2VzcywgLUVFWElTVCB3aGVuIGEgY29udHJvbGxlciBmb3IgdGhl
IHNhbWUgY2FjaGUgbGV2ZWwKPiA+ICsgKiBhbmQgaWQgaXMgYWxyZWFkeSByZWdpc3RlcmVkLCBv
ciBhbm90aGVyIG5lZ2F0aXZlIGVycm5vIG9uIGZhaWx1cmUuCj4gPiArICovCj4gPiAraW50IHJp
c2N2X2NicXJpX3JlZ2lzdGVyX2NjKGNvbnN0IHN0cnVjdCBjYnFyaV9jb250cm9sbGVyX2luZm8g
KmluZm8pCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKm90aGVyOwo+
ID4gKyAgICAgaW50IGVycjsKPiA+ICsKPiA+ICsgICAgIGlmICghaW5mby0+YWRkcikgewo+ID4g
KyAgICAgICAgICAgICBwcl93YXJuKCJza2lwcGluZyBjb250cm9sbGVyIHdpdGggaW52YWxpZCBh
ZGRyPTB4MFxuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAg
fQo+ID4gKwo+ID4gKyAgICAgaWYgKGluZm8tPnR5cGUgIT0gQ0JRUklfQ09OVFJPTExFUl9UWVBF
X0NBUEFDSVRZKSB7Cj4gPiArICAgICAgICAgICAgIHByX3dhcm4oInJlZ2lzdGVyX2NjIGNhbGxl
ZCB3aXRoIG5vbi1jYXBhY2l0eSB0eXBlICV1XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGluZm8tPnR5cGUpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAg
IH0KPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBTUk1DRkcgZW5jb2RlcyBSQ0lEIGlu
IDEyIGJpdHMuIFJlamVjdCBhbiBvdXQtb2YtcmFuZ2UgY291bnQgcmF0aGVyCj4gPiArICAgICAg
KiB0aGFuIGxldCBGSUVMRF9QUkVQKFNSTUNGR19SQ0lEX01BU0ssIGNsb3NpZCkgdHJ1bmNhdGUg
aXQgc2lsZW50bHkuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIGlmIChpbmZvLT5yY2lkX2NvdW50
ID4gRklFTERfTUFYKFNSTUNGR19SQ0lEX01BU0spICsgMSkgewo+ID4gKyAgICAgICAgICAgICBw
cl93YXJuKCJDQyBhdCAlcGEgaGFzIFJDSUQgY291bnQgJXUgYmV5b25kIHRoZSAxMi1iaXQgU1JN
Q0ZHIGZpZWxkLCBza2lwcGluZ1xuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAmaW5mby0+
YWRkciwgaW5mby0+cmNpZF9jb3VudCk7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0
cmwgX19mcmVlKGtmcmVlKSA9Cj4gPiArICAgICAgICAgICAgIGt6YWxsb2Moc2l6ZW9mKCpjdHJs
KSwgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICBpZiAoIWN0cmwpCj4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgbXV0ZXhfaW5pdCgmY3RybC0+bG9jayk7Cj4g
PiArCj4gPiArICAgICBjdHJsLT5iYXNlID0gaW5mby0+YmFzZTsKPiA+ICsgICAgIGN0cmwtPmFk
ZHIgPSBpbmZvLT5hZGRyOwo+ID4gKyAgICAgY3RybC0+c2l6ZSA9IGluZm8tPnNpemU7Cj4gPiAr
ICAgICBjdHJsLT50eXBlID0gaW5mby0+dHlwZTsKPiA+ICsgICAgIGN0cmwtPnJjaWRfY291bnQg
PSBpbmZvLT5yY2lkX2NvdW50Owo+ID4gKyAgICAgY3RybC0+Y2FjaGUuY2FjaGVfaWQgPSBpbmZv
LT5jYWNoZV9pZDsKPiA+ICsgICAgIGN0cmwtPmNhY2hlLmNhY2hlX2xldmVsID0gaW5mby0+Y2Fj
aGVfbGV2ZWw7Cj4gPiArCj4gPiArICAgICBlcnIgPSBjYnFyaV9wcm9iZV9jb250cm9sbGVyKGN0
cmwpOwo+ID4gKyAgICAgaWYgKGVycikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiA+
ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBhbGxvY19jYXBhYmxlIGNvbWVzIGZyb20gdGhl
IHByb2JlIGFib3ZlIGFuZCByY2lkX2NvdW50IGZyb20gdGhlCj4gPiArICAgICAgKiBkaXNjb3Zl
cnkgbGF5ZXIuIFR3byBSQ0lEcyBhcmUgdGhlIG1pbmltdW0gZm9yIGEgdXNlZnVsIHN5c3RlbS4K
PiA+ICsgICAgICAqIHJlc2N0cmwgcmVzZXJ2ZXMgUkNJRCAwIGZvciB0aGUgZGVmYXVsdCBncm91
cCwgc28gb25lIFJDSUQgaGFzCj4gPiArICAgICAgKiBub3RoaW5nIHRvIGFsbG9jYXRlIGJldHdl
ZW4sIGFuZCBDRFAgd291bGQgaGFsdmUgaXQgdG8gemVyby4KPiA+ICsgICAgICAqIFJlamVjdCBm
ZXdlciB0aGFuIHR3by4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgaWYgKGN0cmwtPmFsbG9jX2Nh
cGFibGUgJiYgY3RybC0+cmNpZF9jb3VudCA8IDIpIHsKPiA+ICsgICAgICAgICAgICAgcHJfd2Fy
bigiQ0MgYXQgJXBhIGlzIGFsbG9jLWNhcGFibGUgYnV0IGhhcyBmZXdlciB0aGFuIDIgUkNJRHMs
IHNraXBwaW5nXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICZjdHJsLT5hZGRyKTsKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAg
ICBndWFyZChtdXRleCkoJmNicXJpX2NvbnRyb2xsZXJzX2xvY2spOwo+ID4gKwo+ID4gKyAgICAg
LyogVGhlIHJlc2N0cmwgZ2x1ZSBrZXlzIGl0cyBkb21haW5zIG9uIGNhY2hlX2lkLCBvbmUgY29u
dHJvbGxlciBlYWNoLiAqLwo+ID4gKyAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShvdGhlciwgJmNi
cXJpX2NvbnRyb2xsZXJzLCBsaXN0KSB7Cj4gPiArICAgICAgICAgICAgIGlmIChvdGhlci0+Y2Fj
aGUuY2FjaGVfbGV2ZWwgPT0gaW5mby0+Y2FjaGVfbGV2ZWwgJiYKPiA+ICsgICAgICAgICAgICAg
ICAgIG90aGVyLT5jYWNoZS5jYWNoZV9pZCA9PSBpbmZvLT5jYWNoZV9pZCkgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHByX3dhcm4oIkNDIGF0ICVwYSBkdXBsaWNhdGVzIHRoZSBMJXUgY2Fj
aGUgaWQgJXUgY29udHJvbGxlciBhdCAlcGEsIHNraXBwaW5nXG4iLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmN0cmwtPmFkZHIsIGluZm8tPmNhY2hlX2xldmVsLCBpbmZvLT5j
YWNoZV9pZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZvdGhlci0+YWRkcik7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRVhJU1Q7CgpBIGNvbnRyb2xsZXIg
d2l0aCB0aGUgc2FtZSBjYWNoZSBsZXZlbCBhbmQgQ2FjaGUgSUQgaXMgbm90IG5lY2Vzc2FyaWx5
CmEgZHVwbGljYXRlLiBBIGRpc3RyaWJ1dGVkIExMQyBtYXkgaGF2ZSBtdWx0aXBsZSBwaHlzaWNh
bCBjb250cm9sbGVycwptYW5hZ2luZyB0aGUgc2FtZSBsb2dpY2FsIEwzIHJlc291cmNlLgoKTWF0
Y2hpbmcgY29udHJvbGxlcnMgc2hvdWxkIGluc3RlYWQgYmUgZ3JvdXBlZCBpbnRvIGEgbG9naWNh
bCBjb21wb25lbnQKa2V5ZWQgYnkgKGNhY2hlX2xldmVsLCBjYWNoZV9pZCksIHdpdGggdGhlIHBo
eXNpY2FsIGNvbnRyb2xsZXJzIGtlcHQgaW4KYSBsaW5rZWQgbGlzdC4gVXNlciBzcGFjZSB3b3Vs
ZCBzZWUgb25lIGxvZ2ljYWwgY29udHJvbGxlciBhcyBhIHNpbmdsZQpyZXNjdHJsIEwzIGRvbWFp
biwgd2hpbGUgdGhlIHVwZGF0ZSBwYXRoIHdvdWxkIGl0ZXJhdGUgdGhlIGxpc3QgYW5kCnByb2dy
YW0gZXZlcnkgcGh5c2ljYWwgY29udHJvbGxlci4KCj4gPiArICAgICAgICAgICAgIH0KPiA+ICsg
ICAgIH0KPiA+ICsKPiA+ICsgICAgIGxpc3RfYWRkX3RhaWwoJmN0cmwtPmxpc3QsICZjYnFyaV9j
b250cm9sbGVycyk7Cj4gPiArICAgICByZXRhaW5fYW5kX251bGxfcHRyKGN0cmwpOwo+Cj4gQ29t
bW9uIHRyaWNrIGZvciB0aGlzIGlzIHNvbWV0aGluZyBsaWtlOgo+Cj4gICAgICAgICBsaXN0X2Fk
ZF90YWlsKCZub19mcmVlX3B0cihjdHJsKS0+bGlzdCwgJmNicXJpX2NvbnRyb2xsZXJzKTsKPgo+
IGJlY2F1c2UgaXQgY291cGxlcyBvd25lcnNoaXAgcGFzc2luZyB3aXRoIHN0b3BwaW5nIHRoZSBh
dXRvZnJlZQo+IG1hZ2ljLiAgSSdkIHBlcnNvbmFsbHkgb25seSB1c2UgcmV0YWluX2FuZF9udWxs
X3B0cigpIGluIGNhc2VzIHdoZXJlIEkgbmVlZAo+IHRvIGNoZWNrIGZvciBzdWNjZXNzIG9mIHRo
ZSBvd25lcnNoaXAgYmVpbmcgaGFuZGVkIG9mZi4KPgo+Cj4gPiArICAgICByZXR1cm4gMDsKPiA+
ICt9Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNjdHJsL2NicXJpX2ludGVybmFsLmggYi9k
cml2ZXJzL3Jlc2N0cmwvY2JxcmlfaW50ZXJuYWwuaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzNlMzllNmQzMGM1Cj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9kcml2ZXJzL3Jlc2N0cmwvY2JxcmlfaW50ZXJuYWwuaAo+Cj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9yaXNjdl9jYnFyaS5oIGIvaW5jbHVkZS9saW51eC9yaXNjdl9jYnFy
aS5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5iMGRh
YTFhN2U0MmYKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcmlzY3Zf
Y2JxcmkuaAo+ID4gQEAgLTAsMCArMSw0OSBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgKi8KPiA+ICsvKgo+ID4gKyAqIFB1YmxpYyByZWdpc3RyYXRpb24g
QVBJIGZvciB0aGUgUklTQy1WIENhcGFjaXR5IGFuZCBCYW5kd2lkdGggUW9TCj4gPiArICogUmVn
aXN0ZXIgSW50ZXJmYWNlIChDQlFSSSkgY29yZS4gRGlzY292ZXJ5IGxheWVycyBjYWxsCj4gPiAr
ICogcmlzY3ZfY2JxcmlfcmVnaXN0ZXJfY2MoKSB0byBoYW5kIGEgY2FwYWNpdHkgY29udHJvbGxl
ciBkZXNjcmlwdG9yIHRvCj4gPiArICogdGhlIGNvcmUsIHdoaWNoIG93bnMgYWxsIHN1YnNlcXVl
bnQgc3RhdGUuCj4gPiArICovCj4gPiArI2lmbmRlZiBfTElOVVhfUklTQ1ZfQ0JRUklfSAo+ID4g
KyNkZWZpbmUgX0xJTlVYX1JJU0NWX0NCUVJJX0gKPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgv
ZXJybm8uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+ICsKPiA+ICtlbnVtIGNi
cXJpX2NvbnRyb2xsZXJfdHlwZSB7Cj4gPiArICAgICBDQlFSSV9DT05UUk9MTEVSX1RZUEVfQ0FQ
QUNJVFksCj4gPiArfTsKPiA+ICsKPiA+ICsvKioKPiA+ICsgKiBzdHJ1Y3QgY2JxcmlfY29udHJv
bGxlcl9pbmZvIC0gcmVnaXN0cmF0aW9uIGRlc2NyaXB0b3IKPiA+ICsgKiBAYWRkcjogICAgICAg
IE1NSU8gYmFzZSBhZGRyZXNzIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXIgaW50ZXJmYWNl
Cj4gPiArICogQHNpemU6ICAgICAgICBzaXplIG9mIHRoZSBNTUlPIHJlZ2lvbgo+ID4gKyAqIEB0
eXBlOiAgICAgICAgY29udHJvbGxlciB0eXBlIChjYXBhY2l0eSkKPiA+ICsgKiBAcmNpZF9jb3Vu
dDogIG51bWJlciBvZiBzdXBwb3J0ZWQgUkNJRHMKPiA+ICsgKiBAY2FjaGVfaWQ6ICAgIGNhY2hl
IGlkIHVzZWQgYXMgdGhlIHJlc2N0cmwgZG9tYWluIGlkCj4gPiArICogQGNhY2hlX2xldmVsOiBj
YWNoZSBsZXZlbCAoMiBvciAzKSB0aGUgY29udHJvbGxlciBiYWNrcwo+ID4gKyAqIEBiYXNlOiAg
ICAgICAgbWFwcGVkIHJlZ2lzdGVyIGJsb2NrLCB3aGljaCB0aGUgY2FsbGVyIGtlZXBzIG1hcHBl
ZCBmb3IKPiA+ICsgKiAgICAgICAgICAgICAgIHRoZSBsaWZlIG9mIHRoZSBzeXN0ZW0KPiBPdXQg
b2Ygb3JkZXIgZG9jdW1lbnRhdGlvbiBpcyB1bnVzdWFsLiAgV2h5Pwo+Cj4gPiArICovCj4gPiAr
c3RydWN0IGNicXJpX2NvbnRyb2xsZXJfaW5mbyB7Cj4gPiArICAgICBwaHlzX2FkZHJfdCAgICAg
ICAgICAgICAgICAgICAgIGFkZHI7Cj4gPiArICAgICBwaHlzX2FkZHJfdCAgICAgICAgICAgICAg
ICAgICAgIHNpemU7Cj4gPiArICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAgICAgICAgICpi
YXNlOwo+ID4gKyAgICAgZW51bSBjYnFyaV9jb250cm9sbGVyX3R5cGUgICAgICB0eXBlOwo+ID4g
KyAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICByY2lkX2NvdW50Owo+ID4gKyAg
ICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYWNoZV9pZDsKPiA+ICsgICAgIHUz
MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FjaGVfbGV2ZWw7Cj4gPiArfTsKPiA+ICsK
PiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfQ0JRUkkpCj4gPiAraW50IHJpc2N2X2Ni
cXJpX3JlZ2lzdGVyX2NjKGNvbnN0IHN0cnVjdCBjYnFyaV9jb250cm9sbGVyX2luZm8gKmluZm8p
Owo+ID4gKyNlbHNlCj4gPiArc3RhdGljIGlubGluZSBpbnQKPiA+ICtyaXNjdl9jYnFyaV9yZWdp
c3Rlcl9jYyhjb25zdCBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlcl9pbmZvICppbmZvKQo+ID4gK3sK
PiA+ICsgICAgIHJldHVybiAtRU5PREVWOwo+ID4gK30KPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsj
ZW5kaWYgLyogX0xJTlVYX1JJU0NWX0NCUVJJX0ggKi8KPiA+Cj4KClRoYW5rcywKWXVuaHVpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
