Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F534E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFaN19L2hy8PHybe3fmImIJWgmQ3C93nvXiSWwmNK2U=; b=sVw34gczG+w3rr
	Y6UqWdBN9YT6qsvVVheq5k3YbdR/J+d18/4bTg2I+wg4pbM+v7FtBrzxvMNiHLEd2Lka5BqaFhzQA
	DPPAG9FT+haOArRCzeW4Hvw/P51jLnofnSvHAuhzROpT3H5ipr2/o3//HnhtQ2R6Rfw+nIhBBRpfU
	Q+04mBXg1t2Nztc52CADy9zyalqdbHOkPTU1BLw2RfoQDhLnUVcPzcztWjDmaH/cw3BiOZDSYr2Xx
	J3GozXOE2SGcQrDM2lyyaORR97yaqzHQHliK8swcNqLN7O5BKEactfQy4oEXH5uuXqu2O9faD8LDy
	hSuu73T5BxOAgjo6gEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzUb-0000000DGrg-0FHd;
	Thu, 09 Jan 2025 20:51:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTM-0000000DGRx-0JQw;
	Thu, 09 Jan 2025 20:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95ED55C5C06;
	Thu,  9 Jan 2025 20:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA63C4CED2;
	Thu,  9 Jan 2025 20:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736455782;
	bh=ZXX4c3x7gBrrsmjeXcEhCbYQD0RNFq9SKOTJyfD+w8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWvKKMjG4qNcEdVbxpmuI7b4+HbBdLkpA+CAMEMYEpRiDciCf4+vEIw2Q4+w2yjfZ
	 jTvxs8jEmA05UEDVWAXXpjNc2VtZiEIpRu70xTvqCcsKpRbzaHI1lWSmw7CNxREs+Y
	 tcF2kH3OJnCH5l1gN7nYB+GygB7QcjZAbUF8tBCsIpAxeJJlhSo8SgcHZCtTgRw+5b
	 PAoxrRVlGEHzJLN9Oucuu/ShuUtvjHD6sfNGb0+TMeUfZJg8u1/VX1eDTtxpj2kfwH
	 2u7OfDHS4bABbNg/V0Xml60Go/or9ECQsio/b80eE3ZedaBdcLgKM5LgnvvFLc9HZ/
	 2p9f4xhFqpurg==
Date: Thu, 9 Jan 2025 17:49:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4A2Y269Ffo0ERkS@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4AoFA974kauIJ9T@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_124944_196719_22F058CD 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMTE6NDg6MzZBTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDEyOjU5OjQzUE0gLTAzMDAsIEFybmFs
ZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+IOKsoiBbYWNtZUB0b29sYm94IHBlcmYtdG9v
bHMtbmV4dF0kIGdpdCBsb2cgLS1vbmVsaW5lIC0xIDsgdGltZSBtYWtlIC1DIHRvb2xzL3BlcmYg
YnVpbGQtdGVzdAo+ID4gZDA2ODI2MTYwYTk4MjQ5NCAoSEVBRCAtPiBwZXJmLXRvb2xzLW5leHQp
IHBlcmYgdG9vbHM6IFJlbW92ZSBkZXBlbmRlbmN5IG9uIGxpYmF1ZGl0Cj4gPiBtYWtlOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJm
Jwo+ID4gLSB0YXJwa2c6IC4vdGVzdHMvcGVyZi10YXJnei1zcmMtcGtnIC4KPiA+ICAgICAgICAg
ICAgICAgICAgbWFrZV9zdGF0aWM6IGNkIC4gJiYgbWFrZSBMREZMQUdTPS1zdGF0aWMgTk9fUEVS
Rl9SRUFEX1ZEU08zMj0xIE5PX1BFUkZfUkVBRF9WRFNPWDMyPTEgTk9fSlZNVEk9MSBOT19MSUJU
UkFDRUVWRU5UPTEgTk9fTElCRUxGPTEgLWoyOCAgREVTVERJUj0vdG1wL3RtcC5KSlQzdHZON2JW
Cj4gPiAgICAgICAgICAgICAgIG1ha2Vfd2l0aF9ndGsyOiBjZCAuICYmIG1ha2UgR1RLMj0xIC1q
MjggIERFU1RESVI9L3RtcC90bXAuQkY1M1YycXBsMwo+ID4gLSAvaG9tZS9hY21lL2dpdC9wZXJm
LXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUDogY2QgLiAmJiBt
YWtlIEZFQVRVUkVfRFVNUF9DT1BZPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29s
cy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QICBmZWF0dXJlLWR1bXAKPiA+IGNkIC4gJiYg
bWFrZSBGRUFUVVJFX0RVTVBfQ09QWT0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9v
bHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCBmZWF0dXJlLWR1bXAKPiA+ICAgICAgICAg
IG1ha2Vfbm9fbGliYmlvbmljX086IGNkIC4gJiYgbWFrZSBOT19MSUJCSU9OSUM9MSBGRUFUVVJF
U19EVU1QPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RF
U1RfRkVBVFVSRV9EVU1QIC1qMjggTz0vdG1wL3RtcC5LWnVRMHEyVnM2IERFU1RESVI9L3RtcC90
bXAuMHN4TXlIOTFnUwo+ID4gICAgICAgICAgICBtYWtlX3V0aWxfbWFwX29fTzogY2QgLiAmJiBt
YWtlIHV0aWwvbWFwLm8gRkVBVFVSRVNfRFVNUD0vaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5l
eHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZFQVRVUkVfRFVNUCAtajI4IE89L3RtcC90bXAuWTBN
eDNLTFJFSSBERVNURElSPS90bXAvdG1wLndnOUhDVlZMSEUKPiA+ICAgICAgICAgICAgICAgbWFr
ZV9pbnN0YWxsX086IGNkIC4gJiYgbWFrZSBpbnN0YWxsIEZFQVRVUkVTX0RVTVA9L2hvbWUvYWNt
ZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVAg
LWoyOCBPPS90bXAvdG1wLlAwTEVCQWtXMVggREVTVERJUj0vdG1wL3RtcC5hZ1RhdlpuZEZOCj4g
PiAgIGZhaWxlZCB0byBmaW5kOiBldGMvYmFzaF9jb21wbGV0aW9uLmQvcGVyZgo+IAo+IElzIHRo
aXMgc29tZXRoaW5nIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaD8KCkkgZG9uJ3QgdGhpbmsgc28u
CgpCVFcgdGhpcyBzZXJpZXMgaXMgYWxyZWFkeSBwdXNoZWQgb3V0IHRvIHBlcmYtdG9vbHMtbmV4
dDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYv
cGVyZi10b29scy1uZXh0LmdpdC9sb2cvP2g9cGVyZi10b29scy1uZXh0CgpUaGFua3MhCgotIEFy
bmFsZG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
