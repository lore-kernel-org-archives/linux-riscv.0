Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E0C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYCl6ddaGtKBp5FkSUFp7YtOna2DrFO6h88RiInsoq8=; b=ONDYlDN+Kmj5xW
	LhzBX4NrQ/E8XEFOX2eXswRitgbMJkFr148Zs2nie5+uLWN7vnWSVWM7v64m9wfoZ6PCRFBt2jVAb
	wbNK5TG/+zR+O+CUKEuKKq1KMbrSmCJVQbOtgWwCG2U8ULt3Ozsz/4ByBp1iRTqiaTaawmKx4JEDh
	M71Y5M7Z1Ms9aBkZoLdFOQBdjXmI+5B3ENcKmS1amy2gxjleKLXdpjYDnlRnNbC47uuxfw3HOgxWY
	vG3VNfE8CX5fRl+QjlC6C8TEJjQE3irq4F32TnBLxMD4ZKQaQeaSmn7WbkQyEI/n6KPxxreoAccpV
	cpnIt388vwzfQCOhcOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsn-00000009zX1-2DT7;
	Mon, 04 Aug 2025 08:49:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqLt-00000009uzT-2LvN
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 08:15:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-458b8a63233so10028715e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754295324; x=1754900124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0/hn9Eliq7ebIUdeCMqZrdU4Llw8i8H1X4gsxBpU9U=;
        b=J8pn7e8dTKWSutIB8eHDJq3sR+QkUps2iHGRAI3XYCwu2wp/v6xUS2B1ae40SYeUiO
         8YNCgWmABwuQ/17kTm3BQ2kzTSTGwoF5YxWtAX3BPMAR4xQHDyaNQZ0aAaWhRDSG/8wN
         nqOUhRKMF+jAGwqFc3fSHAjkPTMFUDA/3CBfysYUVLlnxdW3hOmhKD+aJ382fFClcaUM
         TdFg+NlQUdcD44s7oRbf3ylDFX5ot02qv6WFAWcmMxlR/z4KSXmSbM0biMTuRVVA736F
         uJdesNcxFLuKAg5+N7TErrGUH5o7cozdrF/wGW/PR1aDvPewbJX8haAiGIdydht/LNM5
         f14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295324; x=1754900124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0/hn9Eliq7ebIUdeCMqZrdU4Llw8i8H1X4gsxBpU9U=;
        b=bhf47NgY/22rL/NZxyNz7jk0/ZH+NJmMLtEZUVe36NdNTLkQsBZOxJywBzs67v0h7M
         hS75JWJekRVOWsrcdYR8X0UYZDRXD87h/qnX3NxXwYezryh4mzW+57JAQ9Z3tebfXJj/
         9gVGZKgxMuonQcB0qghjLGYXrQAz6t9yoJudYkZuKngqG6r0ekKaBnbhwIGDR10kS2hO
         xZ3LwboXWheAsn4beW8pRp3D1ki0drhUZT9P4HJqBU8M9+w/QHo8t2PUQDoFvucti7Mm
         MIeCt44+yPorA7q4hhLRI1V6DkayqUWvXlvkpaTmsSV8dgwvr7C4PeE6AqUAKol13Ibq
         qxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXUYCPl32jO+5ks6MHBceTRr1ffwJYZvAnVH2HFNOnw6M08W31VNJhwC3HrrW4r9BFW74CfI4zR2PEhZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeZx6N/2QKWRaV6jlg7YBwUcrNYVYh8xZUhkDW+rQUV2JT5n+i
	ym82KVfugw+pWY20ydJoymBy6QUVNnzQFd0pdfI918Werxs3KRrKBaNizmFWF3IT/C4=
X-Gm-Gg: ASbGncvsxasnjOC+YQT2SmoUVpxhRWwSsUu3wkIoW1PrLfTSsYGoO/8bEc9UM+GmWi3
	/29NicirdZQwsQC4LeCZC9XI5KtYnkZxfkKyhXhAgYB3B+mnqnzAIaD4EG98cuDQOnxinH+fH+k
	tCXWRm5+cGycO+H9skGYKoFYX3WdExoQHKfPQ/ImpJrTRHLleUgz/YIF3+6gCCEWR9/Wajbp+LB
	NAc7XxmhYhnbgTiDna7vDNB8rld0Ta4DqS/d9DkG3HufDhwpw75TmDGOzXlVqAfeAlaiNKzeSdh
	Wi2JKuif5CDKuWtG247qEf7/9VqzZn1dJVwcZxbmTsnH08JIMlr9MCsFuFa5wtDiCHQMSnEW1NS
	CMcpDcJMhlrGaPjUj6eh0hw3H7vSPQcy3Q+joDVjRkrDwkWFgUsoa7AzkLx5/cwre56U=
X-Google-Smtp-Source: AGHT+IF2iR02AAB1yhMP8NRjCBEy1r/sjM3towmkE9K8hsnQNhLd85ExCIqMpGCqsotkV7O9JjocBQ==
X-Received: by 2002:a05:600c:6304:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-458b69e0380mr60785165e9.8.1754295323813;
        Mon, 04 Aug 2025 01:15:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bc1f62e7sm79111125e9.2.2025.08.04.01.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 01:15:23 -0700 (PDT)
Message-ID: <b37f6f25-7569-4cae-b33d-61ed14b19611@rivosinc.com>
Date: Mon, 4 Aug 2025 10:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] riscv: hw_breakpoint: Use icount for single
 stepping
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta
 <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, WangYuli
 <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Joel Granados <joel.granados@kernel.org>,
 Celeste Liu <coelacanthushex@gmail.com>, Evan Green <evan@rivosinc.com>,
 Nylon Chen <nylon.chen@sifive.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
 <20250722173829.984082-6-jesse@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250722173829.984082-6-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_011525_606039_DEAAEA7D 
X-CRM114-Status: GOOD (  29.95  )
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

CgpPbiAyMi8wNy8yMDI1IDE5OjM4LCBKZXNzZSBUYXViZSB3cm90ZToKPiBUaGUgU2R0cmlnIFJJ
U0MtViBJU0EgZXh0ZW5zaW9uIGRvZXMgbm90IGhhdmUgYSByZXN1bWUgZmxhZyBmb3IKPiByZXR1
cm5pbmcgdG8gYW5kIGV4ZWN1dGluZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgdGhlIGJyZWFrcG9pbnQu
Cj4gVG8gYXZvaWQgc2tpcHBpbmcgdGhlIGluc3RydWN0aW9uIG9yIGxvb3BpbmcsIGl0IGlzIG5l
Y2Vzc2FyeSB0byByZW1vdmUKPiB0aGUgaGFyZHdhcmUgYnJlYWtwb2ludCBhbmQgc2luZ2xlIHN0
ZXAuIFVzZSB0aGUgaWNvdW50IGZlYXR1cmUgb2YKPiBTZHRyaWcgdG8gYWNjb21wbGlzaCB0aGlz
LiBVc2UgaWNvdW50IGFzIGRlZmF1bHQgd2l0aCBhbiBvcHRpb24gdG8gYWxsb3cKPiBzb2Z0d2Fy
ZS1iYXNlZCBzaW5nbGUgc3RlcHBpbmcgd2hlbiBoYXJkd2FyZSBvciBTQkkgZG9lcyBub3QgaGF2
ZQo+IGljb3VudCBmdW5jdGlvbmFsaXR5LCBhcyBpdCBtYXkgY2F1c2UgdW53YW50ZWQgc2lkZSBl
ZmZlY3RzIHdoZW4gcmVhZGluZwo+IHRoZSBpbnN0cnVjdGlvbiBmcm9tIG1lbW9yeS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgfCAxMSArKysrKwo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9od19icmVha3BvaW50LmMgfCA4MSArKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+IGluZGV4IDk1ZDMwNDdjYWIxMC4uYmJkZTVlMTE4NDcwIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0xMTA1LDYgKzEx
MDUsMTcgQEAgY29uZmlnIFBBUkFWSVJUX1RJTUVfQUNDT1VOVElORwo+ICAKPiAgCSAgSWYgaW4g
ZG91YnQsIHNheSBOIGhlcmUuCj4gIAo+ICtjb25maWcgSFdfQlJFQUtQT0lOVF9DT01QVVRFX1NU
RVAKPiArCWJvb2wgIkFsbG93IGNvbXB1dGluZyBoYXJkd2FyZSBicmVha3BvaW50IHN0ZXAgYWRk
cmVzcyIKPiArCWRlZmF1bHQgbgo+ICsJZGVwZW5kcyBvbiBIQVZFX0hXX0JSRUFLUE9JTlQKPiAr
CWhlbHAKPiArCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIGhhcmR3YXJlIGJyZWFrcG9pbnRzIGFy
ZSBkZXNpcmVkLCBidXQKPiArCSAgaGFyZHdhcmUgb3IgU0JJIGRvZXMgbm90IGhhdmUgaWNvdW50
IGZ1bmN0aW9uYWxpdHkuIFRoaXMgbWF5IGNhdXNlCj4gKwkgIHVud2FudGVkIHNpZGUgYWZmZWN0
cyB3aGVuIHJlYWRpbmcgdGhlIGluc3RydWN0aW9uIGZyb20gbWVtb3J5LgoKSGkgSmVzc2UsCgpU
eXBvOiBzL2FmZmVjdHMvZWZmZWN0cwoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gKwo+ICsJICBJZiB1
bnN1cmUsIHNheSBOLgo+ICsKPiAgY29uZmlnIFJFTE9DQVRBQkxFCj4gIAlib29sICJCdWlsZCBh
IHJlbG9jYXRhYmxlIGtlcm5lbCIKPiAgCWRlcGVuZHMgb24gIVhJUF9LRVJORUwKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvaHdfYnJlYWtwb2ludC5jCj4gaW5kZXggOWUzYTNiODJkMzAwLi40MzdmZDgyYjk1OTAgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jCj4gQEAgLTIwLDYgKzIwLDcgQEAKPiAgI2Rl
ZmluZSBEQlRSX1REQVRBMV9ETU9ERQkJQklUX1VMKF9fcmlzY3ZfeGxlbiAtIDUpCj4gIAo+ICAj
ZGVmaW5lIERCVFJfVERBVEExX1RZUEVfTUNPTlRST0wJKDJVTCA8PCBEQlRSX1REQVRBMV9UWVBF
X1NISUZUKQo+ICsjZGVmaW5lIERCVFJfVERBVEExX1RZUEVfSUNPVU5UCQkoM1VMIDw8IERCVFJf
VERBVEExX1RZUEVfU0hJRlQpCj4gICNkZWZpbmUgREJUUl9UREFUQTFfVFlQRV9NQ09OVFJPTDYJ
KDZVTCA8PCBEQlRSX1REQVRBMV9UWVBFX1NISUZUKQo+ICAKPiAgI2RlZmluZSBEQlRSX1REQVRB
MV9NQ09OVFJPTDZfTE9BRAkJQklUKDApCj4gQEAgLTU1LDYgKzU2LDE0IEBACj4gICNkZWZpbmUg
REJUUl9UREFUQTFfTUNPTlRST0xfU0laRUxPXzY0QklUCTEKPiAgI2RlZmluZSBEQlRSX1REQVRB
MV9NQ09OVFJPTF9TSVpFSElfNjRCSVQJMQo+ICAKPiArI2RlZmluZSBEQlRSX1REQVRBMV9JQ09V
TlRfVQkJCUJJVCg2KQo+ICsjZGVmaW5lIERCVFJfVERBVEExX0lDT1VOVF9TCQkJQklUKDcpCj4g
KyNkZWZpbmUgREJUUl9UREFUQTFfSUNPVU5UX1BFTkRJTkcJCUJJVCg4KQo+ICsjZGVmaW5lIERC
VFJfVERBVEExX0lDT1VOVF9NCQkJQklUKDkpCj4gKyNkZWZpbmUgREJUUl9UREFUQTFfSUNPVU5U
X0NPVU5UX0ZJRUxECQlHRU5NQVNLKDIzLCAxMCkKPiArI2RlZmluZSBEQlRSX1REQVRBMV9JQ09V
TlRfVlUJCQlCSVQoMjUpCj4gKyNkZWZpbmUgREJUUl9UREFUQTFfSUNPVU5UX1ZTCQkJQklUKDI2
KQo+ICsKPiAgLyogUmVnaXN0ZXJlZCBwZXItY3B1IGJwL3dwICovCj4gIHN0YXRpYyBERUZJTkVf
UEVSX0NQVShzdHJ1Y3QgcGVyZl9ldmVudCAqLCBwY3B1X2h3X2JwX2V2ZW50c1tSVl9NQVhfVFJJ
R0dFUlNdKTsKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGxvbmcsIGVjYWxsX2xv
Y2tfZmxhZ3MpOwo+IEBAIC02NSw2ICs3NCw3IEBAIHN0YXRpYyBERUZJTkVfUEVSX0NQVSh1bmlv
biBzYmlfZGJ0cl9zaG1lbV9lbnRyeSwgc2JpX2RidHJfc2htZW0pOwo+ICAKPiAgLyogbnVtYmVy
IG9mIGRlYnVnIHRyaWdnZXJzIG9uIHRoaXMgY3B1IC4gKi8KPiAgc3RhdGljIGludCBkYnRyX3Rv
dGFsX251bSBfX3JvX2FmdGVyX2luaXQ7Cj4gK3N0YXRpYyBib29sIGhhdmVfaWNvdW50IF9fcm9f
YWZ0ZXJfaW5pdDsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZGJ0cl90eXBlIF9fcm9fYWZ0ZXJf
aW5pdDsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZGJ0cl9pbml0IF9fcm9fYWZ0ZXJfaW5pdDsK
PiAgCj4gQEAgLTE2OCw2ICsxNzgsNyBAQCBzdGF0aWMgaW50IGFyY2hfc21wX3RlYXJkb3duX3Ni
aV9zaG1lbSh1bnNpZ25lZCBpbnQgY3B1KQo+ICBzdGF0aWMgdm9pZCBpbml0X3NiaV9kYnRyKHZv
aWQpCj4gIHsKPiAgCXN0cnVjdCBzYmlyZXQgcmV0Owo+ICsJdW5zaWduZWQgbG9uZyBkYnRyX2Nv
dW50ID0gMDsKPiAgCj4gIAkvKgo+ICAJICogQ2FsbGVkIGJ5IGh3X2JyZWFrcG9pbnRfc2xvdHMg
YW5kIGFyY2hfaHdfYnJlYWtwb2ludF9pbml0Lgo+IEBAIC0xODIsNiArMTkzLDI1IEBAIHN0YXRp
YyB2b2lkIGluaXRfc2JpX2RidHIodm9pZCkKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+ICsJcmV0
ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRSX05VTV9UUklHR0VSUywKPiAr
CQlEQlRSX1REQVRBMV9UWVBFX0lDT1VOVCwgMCwgMCwgMCwgMCwgMCk7Cj4gKwlpZiAocmV0LmVy
cm9yKSB7Cj4gKwkJcHJfd2FybigiJXM6IGZhaWxlZCB0byBkZXRlY3QgaWNvdW50IHRyaWdnZXJz
LiBlcnJvcjogJWxkLlxuIiwKPiArCQkJX19mdW5jX18sIHJldC5lcnJvcik7Cj4gKwl9IGVsc2Ug
aWYgKCFyZXQudmFsdWUpIHsKPiArCQlpZiAoSVNfRU5BQkxFRChDT05GSUdfSFdfQlJFQUtQT0lO
VF9DT01QVVRFX1NURVApKSB7Cj4gKwkJCXByX3dhcm4oIiVzOiBObyBpY291bnQgdHJpZ2dlcnMg
YXZhaWxhYmxlLiAiCj4gKwkJCQkiRmFsbGluZy1iYWNrIHRvIGNvbXB1dGluZyBzaW5nbGUgc3Rl
cCBhZGRyZXNzLlxuIiwgX19mdW5jX18pOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCXByX2VycigiJXM6
IE5vIGljb3VudCB0cmlnZ2VycyBhdmFpbGFibGUuXG4iLCBfX2Z1bmNfXyk7Cj4gKwkJCWRidHJf
dG90YWxfbnVtID0gMDsKPiArCQkJcmV0dXJuOwo+ICsJCX0KPiArCX0gZWxzZSB7Cj4gKwkJZGJ0
cl9jb3VudCA9IHJldC52YWx1ZTsKPiArCQloYXZlX2ljb3VudCA9IHRydWU7Cj4gKwl9Cj4gKwo+
ICAJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRSX05VTV9UUklHR0VS
UywKPiAgCQkJREJUUl9UREFUQTFfVFlQRV9NQ09OVFJPTDYsIDAsIDAsIDAsIDAsIDApOwo+ICAJ
aWYgKHJldC5lcnJvcikgewo+IEBAIC0xOTAsNyArMjIwLDcgQEAgc3RhdGljIHZvaWQgaW5pdF9z
YmlfZGJ0cih2b2lkKQo+ICAJfSBlbHNlIGlmICghcmV0LnZhbHVlKSB7Cj4gIAkJcHJfd2Fybigi
JXM6IE5vIG1jb250cm9sNiB0cmlnZ2VycyBhdmFpbGFibGUuXG4iLCBfX2Z1bmNfXyk7Cj4gIAl9
IGVsc2Ugewo+IC0JCWRidHJfdG90YWxfbnVtID0gcmV0LnZhbHVlOwo+ICsJCWRidHJfdG90YWxf
bnVtID0gbWluX25vdF96ZXJvKCh1bnNpZ25lZCBsb25nKXJldC52YWx1ZSwgZGJ0cl9jb3VudCk7
Cj4gIAkJZGJ0cl90eXBlID0gREJUUl9UREFUQTFfVFlQRV9NQ09OVFJPTDY7Cj4gIAkJcmV0dXJu
Owo+ICAJfQo+IEBAIC0yMDUsNyArMjM1LDcgQEAgc3RhdGljIHZvaWQgaW5pdF9zYmlfZGJ0cih2
b2lkKQo+ICAJCXByX2VycigiJXM6IE5vIG1jb250cm9sIHRyaWdnZXJzIGF2YWlsYWJsZS5cbiIs
IF9fZnVuY19fKTsKPiAgCQlkYnRyX3RvdGFsX251bSA9IDA7Cj4gIAl9IGVsc2Ugewo+IC0JCWRi
dHJfdG90YWxfbnVtID0gcmV0LnZhbHVlOwo+ICsJCWRidHJfdG90YWxfbnVtID0gbWluX25vdF96
ZXJvKCh1bnNpZ25lZCBsb25nKXJldC52YWx1ZSwgZGJ0cl9jb3VudCk7Cj4gIAkJZGJ0cl90eXBl
ID0gREJUUl9UREFUQTFfVFlQRV9NQ09OVFJPTDsKPiAgCX0KPiAgfQo+IEBAIC0zNDQsNiArMzc0
LDIxIEBAIHN0YXRpYyBpbnQgcnZfaW5pdF9tY29udHJvbDZfdHJpZ2dlcihjb25zdCBzdHJ1Y3Qg
cGVyZl9ldmVudF9hdHRyICphdHRyLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBp
bnQgcnZfaW5pdF9pY291bnRfdHJpZ2dlcihzdHJ1Y3QgYXJjaF9od19icmVha3BvaW50ICpodykK
PiArewo+ICsJdW5zaWduZWQgbG9uZyB0ZGF0YTEgPSBEQlRSX1REQVRBMV9UWVBFX0lDT1VOVDsK
PiArCj4gKwkvKiBTdGVwIG9uZSBpbnN0cnVjdGlvbiAqLwo+ICsJdGRhdGExIHw9IEZJRUxEX1BS
RVAoREJUUl9UREFUQTFfSUNPVU5UX0NPVU5UX0ZJRUxELCAxKTsKPiArCj4gKwl0ZGF0YTEgfD0g
REJUUl9UREFUQTFfSUNPVU5UX1U7Cj4gKwo+ICsJaHctPnRkYXRhMSA9IHRkYXRhMTsKPiArCWh3
LT50ZGF0YTIgPSAwOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBpbnQgaHdfYnJlYWtw
b2ludF9hcmNoX3BhcnNlKHN0cnVjdCBwZXJmX2V2ZW50ICpicCwKPiAgCQkJICAgICBjb25zdCBz
dHJ1Y3QgcGVyZl9ldmVudF9hdHRyICphdHRyLAo+ICAJCQkgICAgIHN0cnVjdCBhcmNoX2h3X2Jy
ZWFrcG9pbnQgKmh3KQo+IEBAIC0zODksMjQgKzQzNCwyOCBAQCBzdGF0aWMgaW50IHNldHVwX3Np
bmdsZXN0ZXAoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiAgCS8qIFJlbW92ZSBicmVha3BvaW50IGV2ZW4gaWYgcmV0dXJuIGVycm9yIGFzIG5vdCB0byBs
b29wICovCj4gIAlhcmNoX3VuaW5zdGFsbF9od19icmVha3BvaW50KGV2ZW50KTsKPiAgCj4gLQly
ZXQgPSBnZXRfaW5zbihyZWdzLCByZWdzLT5lcGMsICZpbnNuKTsKPiAtCWlmIChyZXQgPCAwKQo+
IC0JCXJldHVybiByZXQ7Cj4gKwlpZiAoaGF2ZV9pY291bnQpIHsKPiArCQlydl9pbml0X2ljb3Vu
dF90cmlnZ2VyKGJwKTsKPiArCX0gZWxzZSB7Cj4gKwkJcmV0ID0gZ2V0X2luc24ocmVncywgcmVn
cy0+ZXBjLCAmaW5zbik7Cj4gKwkJaWYgKHJldCA8IDApCj4gKwkJCXJldHVybiByZXQ7Cj4gIAo+
IC0JbmV4dF9hZGRyID0gZ2V0X3N0ZXBfYWRkcmVzcyhyZWdzLCBpbnNuKTsKPiArCQluZXh0X2Fk
ZHIgPSBnZXRfc3RlcF9hZGRyZXNzKHJlZ3MsIGluc24pOwo+ICAKPiAtCXJldCA9IGdldF9pbnNu
KHJlZ3MsIG5leHRfYWRkciwgJmluc24pOwo+IC0JaWYgKHJldCA8IDApCj4gLQkJcmV0dXJuIHJl
dDsKPiArCQlyZXQgPSBnZXRfaW5zbihyZWdzLCBuZXh0X2FkZHIsICZpbnNuKTsKPiArCQlpZiAo
cmV0IDwgMCkKPiArCQkJcmV0dXJuIHJldDsKPiAgCj4gLQlicF9pbnNuLmJwX3R5cGUgPSBIV19C
UkVBS1BPSU5UX1g7Cj4gLQlicF9pbnNuLmJwX2FkZHIgPSBuZXh0X2FkZHI7Cj4gLQkvKiBHZXQg
dGhlIHNpemUgb2YgdGhlIGludHJ1Y3Rpb24gKi8KPiAtCWJwX2luc24uYnBfbGVuID0gR0VUX0lO
U05fTEVOR1RIKGluc24pOwo+ICsJCWJwX2luc24uYnBfdHlwZSA9IEhXX0JSRUFLUE9JTlRfWDsK
PiArCQlicF9pbnNuLmJwX2FkZHIgPSBuZXh0X2FkZHI7Cj4gKwkJLyogR2V0IHRoZSBzaXplIG9m
IHRoZSBpbnRydWN0aW9uICovCj4gKwkJYnBfaW5zbi5icF9sZW4gPSBHRVRfSU5TTl9MRU5HVEgo
aW5zbik7Cj4gIAo+IC0JcmV0ID0gaHdfYnJlYWtwb2ludF9hcmNoX3BhcnNlKE5VTEwsICZicF9p
bnNuLCBicCk7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwkJcmV0ID0gaHdfYnJl
YWtwb2ludF9hcmNoX3BhcnNlKE5VTEwsICZicF9pbnNuLCBicCk7Cj4gKwkJaWYgKHJldCkKPiAr
CQkJcmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAlyZXQgPSBhcmNoX2luc3RhbGxfaHdfYnJlYWtw
b2ludChldmVudCk7Cj4gIAlpZiAocmV0KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
