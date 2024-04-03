Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1FCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4TLFkTla601hsve5UAPWFVkXBL/GKWk0oAL/O8cch0=; b=WAFv1f7WNz/rSK
	vw7ugCVKyurEbpGcibL/i5eV/gdMyotfSN7ZQXbvImf5NE/VAoyIM1Re2YSQ0S7+Oqqm4wQCCEp6u
	MAFu17cafQvjwAWVUSUIu+IiPtG3T2v2iG0ed2lZITMzvr1xmbVSA8QMKxkwm9OFmTAVvcHjQmlvq
	rW0P4FtB/2zwuoCNybxu5jSQ/wftyirl+1K7Y7XbIa7QJ7wqrym9LAVXdH1aTwU8IbBMLuV/JXoQD
	1Ihp2EpQidoWj/RxMmhpy6EmHy8pBPQ7BNX8hmCLnMCGBNTjFQP7n/84MWFXzlf0xtEbkrnFAIaJ4
	uuxtGQAve9sFs7tOOOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs05J-0000000G0qF-3Pjf;
	Wed, 03 Apr 2024 12:51:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs05E-0000000G0l2-1bkR;
	Wed, 03 Apr 2024 12:51:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41569f1896dso19616925e9.2;
        Wed, 03 Apr 2024 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712148669; x=1712753469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=MdODe3etPGb2HqbItI7iGK8GJCu0Hqz3ngfqbMLIBOIZKQZMcAPcC2rI2P0oI/9P8h
         okVUQ4u1nns5ICZUXU4Z1hGFGJ0xgn622avUClReIe4t97OZpaPO1b7sCD1asHd67yRN
         XQKg5NTa0IqNDm9VjOPcMNnLXUlQLChaEPavJ2GYFzY1JwzvVEjUk14QWSiJXd46zBsa
         IZrQTS5ABLaLoeHK067mbgYH7WHIB+lriF24GyR4ChULYbYJz0Xfmis9sjn/WDXzxeiL
         uhq1gZC98hei99uKD4QKdmPKrkMBMmnbeA3kY6HdWdZR/HEpM1jCoYHpJcALEEIplRfj
         J3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148669; x=1712753469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=ECBQXnQsvWfyp2WKsbT8MXaHm4XTlnwZ6Fsppma47ck7/wX86kBFtlyXV+zfg3CAEI
         aiS/qzJt3GKqIIRzbh0mZLSMkn+16Aqxu3is81TSDz2p8wQ8HO8LF71dQe4ekdoO6c46
         Tk7zzWhSoy3RIlZGew1Fnse7gYcbgMsVLJFwCQfEgjzPiZZB2iPKILE6aXCXN3erEo8O
         qbiXmyUF++uiXTrm5giUt/MX8YT9sghmplzq7w3wSeU5kHh0VCGxA10JUUl6MSg22IDs
         Zq9AyCaDKCwh6RJje9hMdRxI/gs7Vu65930g4NZ53uKnEVOZeJW1wA0trtJQ13OkWV/8
         Rlbg==
X-Forwarded-Encrypted: i=1; AJvYcCWtNNAfYeHUTdMI2m/J/so0z/TXZ2YWDyHxbXUwT93aMfMSu2fldy4Qr+/tten7UmsNC1+lk9kFdUgKJdV5jXlQQ5lYG/BYk2DczOSvoH6grtuLyh5xzRjG2fNXI3T8wMpBCpDWEQqUuNh9hT5txBQrjEl+5AE=
X-Gm-Message-State: AOJu0Yx2klgiqE8iRgLqLrE8iEORGGL1KsTqmn8dY0ubdfKX+VQHvMBN
	ZCUMjd3Rw/S3qY++62N/M1LoQr1IioAByJOy5rQ3lGcxnteJnSNh
X-Google-Smtp-Source: AGHT+IGiMxFFkzEMKwErZDGMsEh8QQujgECEb7hAYrnmXSB8PanQ6hfDeg6f6lJ/1vv3KfoIi9fU0w==
X-Received: by 2002:a05:600c:5710:b0:414:9103:e38c with SMTP id jv16-20020a05600c571000b004149103e38cmr10494666wmb.22.1712148669149;
        Wed, 03 Apr 2024 05:51:09 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id dj11-20020a0560000b0b00b003437799a373sm3724238wrb.83.2024.04.03.05.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 05:51:08 -0700 (PDT)
Message-ID: <0c95aa84-63e6-41be-8c70-3a6dadefd682@gmail.com>
Date: Wed, 3 Apr 2024 14:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] Unified cross-architecture kernel-mode FPU API
To: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, "Wentland, Harry" <Harry.Wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_055116_512391_064B7E84 
X-CRM114-Status: GOOD (  24.90  )
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

SSBvbmx5IHNraW1tZWQgb3ZlciB0aGUgcGxhdGZvcm0gcGF0Y2hlcyBhbmQgc3BlbmQgb25seSBh
IGZldyBtaW51dGVzIG9uIAp0aGUgYW1kZ3B1IHN0dWZmLgoKIEZyb20gd2hhdCBJJ3ZlIHNlZW4g
dGhpcyBzZXJpZXMgc2VlbXMgdG8gbWFrZSBwZXJmZWN0IHNlbnNlIHRvIG1lLCBJIApqdXN0IGNh
bid0IGZ1bGx5IGp1ZGdlIGV2ZXJ5dGhpbmcuCgpTbyBmZWVsIGZyZWUgdG8gYWRkIEFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IApidXQgSSBzdHJv
bmdseSBzdWdnZXN0IHRoYXQgSGFycnkgYW5kIFJvZHJpZ28gdGFrZSBhIGxvb2sgYXMgd2VsbC4K
ClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFtIDI5LjAzLjI0IHVtIDA4OjE4IHNjaHJpZWIgU2FtdWVs
IEhvbGxhbmQ6Cj4gVGhpcyBzZXJpZXMgdW5pZmllcyB0aGUga2VybmVsLW1vZGUgRlBVIEFQSSBh
Y3Jvc3Mgc2V2ZXJhbCBhcmNoaXRlY3R1cmVzCj4gYnkgd3JhcHBpbmcgdGhlIGV4aXN0aW5nIGZ1
bmN0aW9ucyAod2hlcmUgbmVlZGVkKSBpbiBjb25zaXN0ZW50bHktbmFtZWQKPiBmdW5jdGlvbnMg
cGxhY2VkIGluIGEgY29uc2lzdGVudCBoZWFkZXIgbG9jYXRpb24sIHdpdGggbW9zdGx5IHRoZSBz
YW1lCj4gc2VtYW50aWNzOiB0aGV5IGNhbiBiZSBjYWxsZWQgZnJvbSBwcmVlbXB0aWJsZSBvciBu
b24tcHJlZW1wdGlibGUgdGFzawo+IGNvbnRleHQsIGFuZCBhcmUgbm90IGFzc3VtZWQgdG8gYmUg
cmVlbnRyYW50LiBBcmNoaXRlY3R1cmVzIGFyZSBhbHNvCj4gZXhwZWN0ZWQgdG8gcHJvdmlkZSBD
RkxBR1MgYWRqdXN0bWVudHMgZm9yIGNvbXBpbGluZyBGUFUtZGVwZW5kZW50IGNvZGUuCj4gRm9y
IHRoZSBtb21lbnQsIFNJTUQvdmVjdG9yIHVuaXRzIGFyZSBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMg
Y29tbW9uIEFQSS4KPgo+IFRoaXMgYWxsb3dzIHVzIHRvIHJlbW92ZSB0aGUgaWZkZWZmZXJ5IGFu
ZCBkdXBsaWNhdGVkIE1ha2VmaWxlIGxvZ2ljIGF0Cj4gZWFjaCBGUFUgdXNlci4gSXQgdGhlbiBp
bXBsZW1lbnRzIHRoZSBjb21tb24gQVBJIG9uIFJJU0MtViwgYW5kIGNvbnZlcnRzCj4gYSBjb3Vw
bGUgb2YgdXNlcnMgdG8gdGhlIG5ldyBBUEk6IHRoZSBBTURHUFUgRFJNIGRyaXZlciwgYW5kIHRo
ZSBGUFUKPiBzZWxmIHRlc3QuCj4KPiBUaGUgdW5kZXJseWluZyBnb2FsIG9mIHRoaXMgc2VyaWVz
IGlzIHRvIGFsbG93IHVzaW5nIG5ld2VyIEFNRCBHUFVzCj4gKGUuZy4gTmF2aSkgb24gUklTQy1W
IGJvYXJkcyBzdWNoIGFzIFNpRml2ZSdzIEhpRml2ZSBVbm1hdGNoZWQuIFRob3NlCj4gR1BVcyBu
ZWVkIENPTkZJR19EUk1fQU1EX0RDX0ZQIHRvIGluaXRpYWxpemUsIHdoaWNoIHJlcXVpcmVzIGtl
cm5lbC1tb2RlCj4gRlBVIHN1cHBvcnQuCj4KPiBQcmV2aW91cyB2ZXJzaW9uczoKPiB2MzogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzIwMjQwMzI3MjAwMTU3LjEwOTcwODkt
MS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwo+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1rZXJuZWwvMjAyMzEyMjgwMTQyMjAuMzU2MjY0MC0xLXNhbXVlbC5ob2xsYW5kQHNp
Zml2ZS5jb20vCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtlcm5lbC8yMDIz
MTIwODA1NTUwMS4yOTE2MjAyLTEtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8KPiB2MDogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2VybmVsLzIwMjMxMTIyMDMwNjIxLjM3NTkzMTMt
MS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAgIC0gQWRk
IG1pc3NlZCBDRkxBR1MgY2hhbmdlcyBmb3IgcmVjb3ZfbmVvbl9pbm5lci5jCj4gICAgIChmaXhl
cyBhcm0gYnVpbGQgZmFpbHVyZXMpCj4gICAtIEZpeCB4ODYgaW5jbHVkZSBndWFyZCBpc3N1ZSAo
Zml4ZXMgeDg2IGJ1aWxkIGZhaWx1cmVzKQo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgIC0gUmViYXNl
IG9uIHY2LjktcmMxCj4gICAtIExpbWl0IHJpc2N2IEFSQ0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9S
VCB0byA2NEJJVAo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgIC0gQWRkIGRvY3VtZW50YXRpb24gZXhw
bGFpbmluZyB0aGUgYnVpbHQtdGltZSBhbmQgcnVudGltZSBBUElzCj4gICAtIEFkZCBhIGxpbnV4
L2ZwdS5oIGhlYWRlciBmb3IgZ2VuZXJpYyBpc29sYXRpb24gZW5mb3JjZW1lbnQKPiAgIC0gUmVt
b3ZlIGZpbGUgbmFtZSBmcm9tIGhlYWRlciBjb21tZW50Cj4gICAtIENsZWFuIHVwIGFyY2gvYXJt
NjQvbGliL01ha2VmaWxlLCBsaWtlIGZvciBhcmNoL2FybQo+ICAgLSBSZW1vdmUgUklTQy1WIGFy
Y2hpdGVjdHVyZS1zcGVjaWZpYyBwcmVwcm9jZXNzb3IgY2hlY2sKPiAgIC0gU3BsaXQgYWx0aXZl
YyByZW1vdmFsIHRvIGEgc2VwYXJhdGUgcGF0Y2gKPiAgIC0gVXNlIGxpbnV4L2ZwdS5oIGluc3Rl
YWQgb2YgYXNtL2ZwdS5oIGluIGNvbnN1bWVycwo+ICAgLSBEZWNsYXJlIHRlc3RfZnB1KCkgaW4g
YSBoZWFkZXIKPgo+IE1pY2hhZWwgRWxsZXJtYW4gKDEpOgo+ICAgIGRybS9hbWQvZGlzcGxheTog
T25seSB1c2UgaGFyZC1mbG9hdCwgbm90IGFsdGl2ZWMgb24gcG93ZXJwYwo+Cj4gU2FtdWVsIEhv
bGxhbmQgKDE0KToKPiAgICBhcmNoOiBBZGQgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUCj4g
ICAgQVJNOiBJbXBsZW1lbnQgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUCj4gICAgQVJNOiBj
cnlwdG86IFVzZSBDQ19GTEFHU19GUFUgZm9yIE5FT04gQ0ZMQUdTCj4gICAgYXJtNjQ6IEltcGxl
bWVudCBBUkNIX0hBU19LRVJORUxfRlBVX1NVUFBPUlQKPiAgICBhcm02NDogY3J5cHRvOiBVc2Ug
Q0NfRkxBR1NfRlBVIGZvciBORU9OIENGTEFHUwo+ICAgIGxpYi9yYWlkNjogVXNlIENDX0ZMQUdT
X0ZQVSBmb3IgTkVPTiBDRkxBR1MKPiAgICBMb29uZ0FyY2g6IEltcGxlbWVudCBBUkNIX0hBU19L
RVJORUxfRlBVX1NVUFBPUlQKPiAgICBwb3dlcnBjOiBJbXBsZW1lbnQgQVJDSF9IQVNfS0VSTkVM
X0ZQVV9TVVBQT1JUCj4gICAgeDg2L2ZwdTogRml4IGFzbS9mcHUvdHlwZXMuaCBpbmNsdWRlIGd1
YXJkCj4gICAgeDg2OiBJbXBsZW1lbnQgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUCj4gICAg
cmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwtbW9kZSBGUFUKPiAgICBkcm0vYW1kL2Rpc3Bs
YXk6IFVzZSBBUkNIX0hBU19LRVJORUxfRlBVX1NVUFBPUlQKPiAgICBzZWxmdGVzdHMvZnB1OiBN
b3ZlIEZQIGNvZGUgdG8gYSBzZXBhcmF0ZSB0cmFuc2xhdGlvbiB1bml0Cj4gICAgc2VsZnRlc3Rz
L2ZwdTogQWxsb3cgYnVpbGRpbmcgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcwo+Cj4gICBEb2N1bWVu
dGF0aW9uL2NvcmUtYXBpL2Zsb2F0aW5nLXBvaW50LnJzdCAgICAgfCA3OCArKysrKysrKysrKysr
KysrKysrCj4gICBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2luZGV4LnJzdCAgICAgICAgICAgICAg
fCAgMSArCj4gICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNSArKwo+ICAgYXJjaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDYgKysKPiAgIGFyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgIGFyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA3ICsrCj4gICBhcmNoL2FybS9pbmNsdWRlL2FzbS9mcHUuaCAgICAgICAgICAgICAgICAg
ICAgfCAxNSArKysrCj4gICBhcmNoL2FybS9saWIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArLQo+ICAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICAgYXJjaC9hcm02NC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDkgKystCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2ZwdS5oICAgICAgICAg
ICAgICAgICAgfCAxNSArKysrCj4gICBhcmNoL2FybTY0L2xpYi9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNiArLQo+ICAgYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ICAgYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgKy0KPiAgIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2ZwdS5o
ICAgICAgICAgICAgICB8ICAxICsKPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgIGFyY2gvcG93ZXJwYy9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA1ICstCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnB1Lmgg
ICAgICAgICAgICAgICAgfCAyOCArKysrKysrCj4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Zw
dS5oICAgICAgICAgICAgICAgICAgfCAxNiArKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9rZXJu
ZWxfbW9kZV9mcHUuYyAgICAgICAgICAgfCAyOCArKysrKysrCj4gICBhcmNoL3g4Ni9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBhcmNoL3g4Ni9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrKwo+ICAgYXJjaC94ODYvaW5j
bHVkZS9hc20vZnB1LmggICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKwo+ICAgYXJjaC94ODYv
aW5jbHVkZS9hc20vZnB1L3R5cGVzLmggICAgICAgICAgICAgIHwgIDYgKy0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnICAgICAgICAgICB8ICAyICstCj4gICAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vZGNfZnB1LmMgICAgfCAzNSArLS0tLS0tLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUgICB8IDM2ICstLS0t
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbDIvTWFrZWZpbGUgIHwg
MzYgKy0tLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2ZwdS5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxMiArKysKPiAgIGxpYi9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gICBsaWIvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyNiArLS0tLS0tCj4gICBsaWIvcmFpZDYvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAzMyArKystLS0tLQo+ICAgbGliL3Rlc3RfZnB1LmggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysKPiAgIGxpYi97dGVzdF9mcHUuYyA9PiB0ZXN0
X2ZwdV9nbHVlLmN9ICAgICAgICAgICB8IDM3ICsrLS0tLS0tLQo+ICAgbGliL3Rlc3RfZnB1X2lt
cGwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzcgKysrKysrKysrCj4gICAzOCBmaWxl
cyBjaGFuZ2VkLCAzNDggaW5zZXJ0aW9ucygrKSwgMTkzIGRlbGV0aW9ucygtKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vY29yZS1hcGkvZmxvYXRpbmctcG9pbnQucnN0Cj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vaW5jbHVkZS9hc20vZnB1LmgKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2ZwdS5oCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ZwdS5oCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mcHUuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX2ZwdS5jCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC94ODYvaW5jbHVkZS9hc20vZnB1LmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L2ZwdS5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Rlc3RfZnB1LmgKPiAg
IHJlbmFtZSBsaWIve3Rlc3RfZnB1LmMgPT4gdGVzdF9mcHVfZ2x1ZS5jfSAoNzElKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGxpYi90ZXN0X2ZwdV9pbXBsLmMKPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
