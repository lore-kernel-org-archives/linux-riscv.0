Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82308C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 10:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7WIi/jusKiwy8TalF64CSFX9rwbHAm9JSJ8tDNK7HY=; b=Rl41rP0edaKGAY
	6iugBszWyy0eIAMDNUtVukJbts1Q79hnwiOB0kkHtgKGOsQ+EHxzA4OXWika5NclG7zD/JaTPClgo
	xrvLHLtpUF1xy4qTOP63VBtriAGEyn1vBU0zyIgmBYmM6VDRTP9Q+04M/IftyRaaynZINJYQ2cBs9
	GIL6iIt+ga/UzeYcGdbWUH5EOolwgCFxxsq82ZuCNdbfPsPYbPGqmxRziW/A4aWzFDDcVA+MYN7CF
	MKjSsxD1Ow2WvDUzs4jqkGPiiQNSKoLcRyeazQmBWGbjgB4fAx0fQlZVA9hVgWDhEo7MqLAZSSG/P
	kDKFl/0Hj918Xt8WgizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnR7-00000003LBo-3cBU;
	Tue, 11 Feb 2025 10:24:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnPF-00000003Kms-2U6B
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 10:22:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so1019791f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739269336; x=1739874136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbTkI137Y14wF/SYmxqIN/canr7i5I0Hovyc00mQ21Q=;
        b=r93Kg1aZSJKAVLaPjZVa79sxxs1blaFFODjNsoXUtwXfQRBF03nNSpo8aeN17aZPqy
         Ked9YTRztMFc+D4FXvdi0o1FwgC5CwAGBwXpT9kNdTlKXUy8Qmwj6g67PKLhTSQxOy7z
         e+1q04s85B2/tbwCU83EPgxILcImYNt4/XjioK1MYuJbHEegleTC6qMtsbL4eZUeiIv7
         vSbAAvZwdUwDQmhoKwkhtZLN5SAtSlELAG0eVK3hWSmxUUgJzm2TYYIj8IFQ13J+TAOx
         7mh4zIdbDc0d/Tpb1pwNJjqYrTPBi/HBKrNahxco6m0CsIycLEG3bS+eB8gYUGj8S41h
         +0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269336; x=1739874136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbTkI137Y14wF/SYmxqIN/canr7i5I0Hovyc00mQ21Q=;
        b=YZwdVFbWRx85gLb7pjBDgyQ/5QwYiqeiPWj3ux0oVOZdU4KUxaW/lYUafRBHoJ7lYb
         qyc3rgMNJmcUnLd3eH0Ro/8rB346Gf5nY9rd9bFMR2wMJGc7lqkI5ec2DfzauQiUUJB0
         zAaDyGwrVHg28DIXHjdu4Rw5OAZWF3B3Z8uGC/kT47FvUX/8FA49OeGtvdd6XQEIDCNA
         L65DcDEJpaiRCS+64AQ86qdfF0rNLUzZg8U9Mt9hNsNDfUuwTeO0IH+UuonSDRydLlmN
         qqVntJcYx1dsgDllUOGTt6zSLEkqZu6Lhnfx7Fd1wuHeKqrLz9AY9zVXw2K3hSUmRkjb
         494A==
X-Forwarded-Encrypted: i=1; AJvYcCUIF4tONwudYuWd1k6I3U+FNV0EaEcetG2pYKOseVp7H9b619LC6FjAVFFnoTP4I/ICFZCUrE2M3RjWUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNh5E6LuQqJg9pcNSj3Cc1eejToMpbhI2ONjVh9tULD/Kb33Vm
	gHGrk1ofP3PDcX6DUl9dkmsG6+MCqUSOiybP/JsbHq4QJ+CiBqNyPzRlKoPSWX4p4Hu/OeySyvN
	vCnk=
X-Gm-Gg: ASbGncsO3/FCM9t2GQajGp4oPfCwdxRGc7i8j+9M2PPbF0nj7CMPk/+4h37+KtS4l7c
	9jg4a3vSHB1nF1Z1eL/JESKwelWEDqx3yoVxPoX43GlSEw+rqYmC8L3u+pVxHLplATU3hr4AAZB
	uc0PfwtzSdBbUOmoSKlByPcQuuh1zWcyIxIESOADrtmvhTpkF0gAQ93SMbb+USJoJjktPh5bja3
	9wMH6c+j7W3nBnuhJy4ip/K0J/sR8+N3p0Qsgswa8wqnqKaBV9saqy8uyWi0mBgG1VBVdLdAEi3
	xjVtBxBXubhfneXIHTs7M+rYCYMRltmnz0Q6C+tbzWG/JXpodsnC4AJu884d
X-Google-Smtp-Source: AGHT+IE/VDZ/kthICpSFub15CIFFhymKXrELJBlE9QL1p52esUXfeUro+7ZTlxdosY1on0C+EDMpQQ==
X-Received: by 2002:a05:6000:186d:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38dc9491e85mr14386986f8f.48.1739269334365;
        Tue, 11 Feb 2025 02:22:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc73c2e00sm12529611f8f.57.2025.02.11.02.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:22:13 -0800 (PST)
Message-ID: <cfd0a7d1-464f-468d-9302-46d6b28efe5f@rivosinc.com>
Date: Tue, 11 Feb 2025 11:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-stifle-remake-4e497e96fd66@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-stifle-remake-4e497e96fd66@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_022217_630800_EC372E0F 
X-CRM114-Status: GOOD (  24.80  )
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

CgpPbiAwNS8wMi8yMDI1IDE3OjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBVc2luZyBDbGVtZW50J3Mg
bmV3IHZhbGlkYXRpb24gY2FsbGJhY2tzLCBzdXBwb3J0IGNoZWNraW5nIHRoYXQKPiBkZXBlbmRl
bmNpZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIGZsb2F0aW5nIHBvaW50IGV4dGVuc2lv
bnMuCj4gCj4gVGhlIGNoZWNrIGZvciAiZCIgbWlnaHQgYmUgc2xpZ2h0bHkgY29uZnVzaW5nbHkg
c2hvcnRlciB0aGFuIHRoYXQgb2YgImYiLAo+IGRlc3BpdGUgImQiIGRlcGVuZGluZyBvbiAiZiIu
IFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVxdWlyZW1lbnQgdGhhdCBhCj4gaGFydCBzdXBwb3J0aW5n
IGRvdWJsZSBwcmVjaXNpb24gbXVzdCBhbHNvIHN1cHBvcnQgc2luZ2xlIHByZWNpc2lvbiwKPiBz
aG91bGQgYmUgdmFsaWRhdGVkIGJ5IGR0LWJpbmRpbmdzIGV0Yywgbm90IHRoZSBrZXJuZWwgYnV0
IGxhY2sgb2YKPiBzdXBwb3J0IGZvciBzaW5nbGUgcHJlY2lzaW9uIG9ubHkgaXMgYSBsaW1pdGF0
aW9uIG9mIHRoZSBrZXJuZWwuCj4gCj4gU2luY2UgdmVjdG9yIHdpbGwgbm93IGJlIGRpc2FibGVk
IHByb2FjdGl2ZWx5LCB0aGVyZSdzIG5vIG5lZWQgdG8gY2xlYXIKPiB0aGUgYml0IGluIGVsZl9o
d2NhcCBpbiByaXNjdl9maWxsX2h3Y2FwKCkgYW55IGxvbmdlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDFjMTQ4ZWNlYTYxMi4uYWQ0ZmJhYTRmZjBk
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0xMDksNiArMTA5LDI5IEBAIHN0YXRp
YyBpbnQgcmlzY3ZfZXh0X3ppY2Jvel92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhICpkYXRhLAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgcmlzY3Zf
ZXh0X2ZfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAr
CQkJCWNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4gK3sKPiArCWlmICghX19yaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKSB7
Cj4gKwkJcHJfd2Fybl9vbmNlKCJUaGlzIGtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IHN5c3RlbXMg
d2l0aCBGIGJ1dCBub3QgRFxuIik7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9CgpXaGlsZSBJ
IHRlc3RlZCB0byByZW1vdmUgdGhlIFJJU0NWX0lTQV9FWFRfZCBmcm9tIHRoZSBpbnB1dCBpc2Eg
Yml0bWFwCmFuZCBpdCB3b3JrZWQsIEkgZGlkbid0IHJlYWxpemVkIHRoYXQgaXQgd2FzIGR1ZSB0
byB0aGUgcHJvYmUgb3JkZXIgb2YKc2luZ2xlIGxldHRlciBleHRlbnNpb25zLiBEIGlzIHByb2Jl
ZCBiZWZvcmUgRiBzbyB0aGF0IHdvcmtzIGFzCmV4cGVjdGVkLiBCdXQgcmV0dXJuaW5nIC1FUFJP
QkVERUZFUiB3b3VsZCBub3QgYWxsb3cgdG8gZGlzcGxheSB0aGUKd2Fybl9vbmNlIG9yIHdyb25n
bHkgZGlzcGxheSBpdCBpZiBEIHdhcyBub3QgeWV0IHByb2JlZC4gU28gSSdtIGluY2xpbmVkCnRv
IGtlZXAgaXQgYXMgaXMgYW5kIHJlbHkgb24gcHJvYmUgb3JkZXIgKGEgYml0IGZyYWdpbGUgYnV0
IGZvciBzaW5nbGUKbGV0dGVyIGV4dGVuc2lvbnMsIHRoYXQgc2VlbXMgYWNjZXB0YWJsZSkuCgo+
ICsKPiArCWlmICghSVNfRU5BQkxFRChDT05GSUdfRlBVKSkKPiArCQlyZXR1cm4gLUVJTlZBTDsK
Ckkgd291bGQgaGF2ZSBhY3R1YWxseSBtb3ZlIHRoYXQgY2h1bmsgYmVmb3JlIHRoZQpfX3Jpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkgY2hlY2sgc28gdGhhdCB0aGUgd2hvbGUgZnVuY3Rp
b24gYm9keQppcyBlbGlkZWQgaWYgRlBVIGlzIGRpc2FibGVkLgoKQ2zDqW1lbnQKCj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gK30KCj4gKwo+ICtzdGF0aWMgaW50IHJpc2N2X2V4dF9kX3ZhbGlkYXRlKGNv
bnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEsCj4gKwkJCQljb25zdCB1bnNpZ25l
ZCBsb25nICppc2FfYml0bWFwKQo+ICt7Cj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0ZQVSkp
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRp
YyBpbnQgcmlzY3ZfZXh0X3ZlY3Rvcl94X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2Ff
ZXh0X2RhdGEgKmRhdGEsCj4gIAkJCQkgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2Jp
dG1hcCkKPiAgewo+IEBAIC0zNjgsOCArMzkxLDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9l
eHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShpLCBS
SVNDVl9JU0FfRVhUX2kpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEobSwgUklTQ1ZfSVNBX0VY
VF9tKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGEsIFJJU0NWX0lTQV9FWFRfYSksCj4gLQlf
X1JJU0NWX0lTQV9FWFRfREFUQShmLCBSSVNDVl9JU0FfRVhUX2YpLAo+IC0JX19SSVNDVl9JU0Ff
RVhUX0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZB
TElEQVRFKGYsIFJJU0NWX0lTQV9FWFRfZiwgcmlzY3ZfZXh0X2ZfdmFsaWRhdGUpLAo+ICsJX19S
SVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoZCwgUklTQ1ZfSVNBX0VYVF9kLCByaXNjdl9leHRf
ZF92YWxpZGF0ZSksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX3Ep
LAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9FWFRfYywgcmlzY3Zf
Y19leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh2LCBSSVNDVl9J
U0FfRVhUX3YsIHJpc2N2X3ZfZXh0cywgcmlzY3ZfZXh0X3ZlY3Rvcl9mbG9hdF92YWxpZGF0ZSks
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
