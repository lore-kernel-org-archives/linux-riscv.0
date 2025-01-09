Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A953E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTcVxqQryDikw82Njd0rAR/tYgCVMx3ub2WiPxdzSU8=; b=Q3Yw5zPOO/Bx6O
	PmmimgUP/wjau3tnMQ3s1AyWCslXQE5goeznPI128CivmvIoTvDRHzNy1+nVE34Bjh+8SaKnU6np0
	S00ENstHS7QwnJ0xoxjg0PZFgENZwlenyRqU9yGAeWbetID+gJLgZF3ZUP/2RiMLcELXY2Zd93YLS
	b4S4/SFPw6fADyAYPs/Sqy47z42ZUvjtfwaEJe4GsmmPKB0MhgA0t7dZLQsMuxs+0FlDUwzG6K4S9
	vIqzEBmUipNAZDv19O/z5BNqwzFHNl7YGwfS8QKSEA3rsrQul+nnTJ80xXNzBsITGToEVFlTtm4Bk
	9ZqRgYj0weUSEb8mp2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzrR-0000000DKsG-1svP;
	Thu, 09 Jan 2025 21:14:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzrO-0000000DKrI-2cOS
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 21:14:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21669fd5c7cso22450885ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736457274; x=1737062074; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWi0Eghj3xi161PysLI0KrpGNdQD8oYgIL/QlYOb5cw=;
        b=HMsQ6gut475uFPOTsnrJ+NfZwZPgqSV40ZfCuLwZEPgOVICwIziqnUZ1sMlyzOn4e1
         tuAmKtLpi9nxti6dVaQczBDPCfjJDs+nvwoyKtqjvljQeSdkQsgQefXo14h5O3zDvjzj
         yNiEed1wJDAwdIuj1wsAwEpAO7eKaVJ2yrbzQOHTxFguywgFpGtKRLXo6IEzKZv+fmNs
         HVZMBYyC+KovyWahagkqz+R9ISMBaMLzmqoJdEE+WTT1Q30Tdo1R8dJfMRPvg/FV5THk
         MjrauZynqxifeOJrhvz5LdD2tq43+5DoPQuL4oKEKknVmqxO2yiiBPfyABd+MWMjNwkA
         ohjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457274; x=1737062074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWi0Eghj3xi161PysLI0KrpGNdQD8oYgIL/QlYOb5cw=;
        b=jIOoZubod+c7aOAFS2tQwsZ507abJT22VgS5oLIYQyUv+KYiEFsHHuGzPAthg66uDr
         TRl9q/IJyDrdDGdW/fytKxvyoLHYWkCZgKo2nN+p+TmOnBR4PmcFSKwTFGxxePwwUAGV
         8esyHYh7fQa9WU7H/jNzavEZVsFKXHQuHtBZrC0ilRa0SUqXX/izbYf0WXuzwzSqs19b
         Sd/NMyA66AyZe3yE5qO1hj/ZnyU5aNCuAoXlVJZeqqcRKYVjQz0s6C3dVfDAhs2qsZgc
         aFy+BDliTwwyzVEeyXDIi04E7h9C9QnolV+fAZI64uOreGombkP+3hA0EeZpGxbfbKFw
         tJmg==
X-Forwarded-Encrypted: i=1; AJvYcCVt9RqdjrAni+nhc5FtLVwnfcmH/4qIoJH7jkE6PEcxT9B90hAobG4F2qwP6o3OFAzzlbBkN3A7pbEk2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79FGfQJ3+kQD5zfGN43wyBllKs3xYZfRLpULl/6ulYirQoXIV
	MdFb+wXotkvBkFN9mfE96qa+QTrttfpctShfDNMLm30AQOgUDqRCSlRB56qUQBw=
X-Gm-Gg: ASbGncs7T3SWQrelyy1Kfy0v57RBhfC1KMvpchcbkj/W/KOZRoSnIsug3R7R1iUVEih
	t7CizNEorRXOTWpWqZEhgoooNRcjCTg1zzlt+hhz9/8eUkxpIGqd4K4vfH+NIYgUYko9cxdWl/A
	0PRtPhCAHj/0N5a+gbhMZqS/5ykK7BvC/wpHY6YsaSJ5R2aMY6Csu32RcLOd33H5nUO0NbrcPIF
	E0cj2Ts50iGdMFsNNs/Y4qBs9xXWLAgHF7Ozev6qK5hGj5aYmUz
X-Google-Smtp-Source: AGHT+IGGpIFpDMCF6QbYUycaFsLmnN4FCC576ZSX1GeEVOuZ9RO46wvil+eTCx3t+IaGa75ky/Kjtw==
X-Received: by 2002:a17:90b:520e:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f548f424b1mr12478961a91.33.1736457273807;
        Thu, 09 Jan 2025 13:14:33 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm4117850a91.31.2025.01.09.13.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:14:33 -0800 (PST)
Date: Thu, 9 Jan 2025 13:14:29 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Message-ID: <Z4A8NU02WVBDGrYZ@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4A2Y269Ffo0ERkS@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131434_925179_8E951357 
X-CRM114-Status: GOOD (  13.87  )
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

T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMDU6NDk6MzlQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDExOjQ4OjM2QU0gLTA4
MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDA5LCAyMDI1IGF0IDEy
OjU5OjQzUE0gLTAzMDAsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyB3cm90ZToKPiA+ID4g4qyi
IFthY21lQHRvb2xib3ggcGVyZi10b29scy1uZXh0XSQgZ2l0IGxvZyAtLW9uZWxpbmUgLTEgOyB0
aW1lIG1ha2UgLUMgdG9vbHMvcGVyZiBidWlsZC10ZXN0Cj4gPiA+IGQwNjgyNjE2MGE5ODI0OTQg
KEhFQUQgLT4gcGVyZi10b29scy1uZXh0KSBwZXJmIHRvb2xzOiBSZW1vdmUgZGVwZW5kZW5jeSBv
biBsaWJhdWRpdAo+ID4gPiBtYWtlOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2FjbWUvZ2l0
L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmJwo+ID4gPiAtIHRhcnBrZzogLi90ZXN0cy9wZXJm
LXRhcmd6LXNyYy1wa2cgLgo+ID4gPiAgICAgICAgICAgICAgICAgIG1ha2Vfc3RhdGljOiBjZCAu
ICYmIG1ha2UgTERGTEFHUz0tc3RhdGljIE5PX1BFUkZfUkVBRF9WRFNPMzI9MSBOT19QRVJGX1JF
QURfVkRTT1gzMj0xIE5PX0pWTVRJPTEgTk9fTElCVFJBQ0VFVkVOVD0xIE5PX0xJQkVMRj0xIC1q
MjggIERFU1RESVI9L3RtcC90bXAuSkpUM3R2TjdiVgo+ID4gPiAgICAgICAgICAgICAgIG1ha2Vf
d2l0aF9ndGsyOiBjZCAuICYmIG1ha2UgR1RLMj0xIC1qMjggIERFU1RESVI9L3RtcC90bXAuQkY1
M1YycXBsMwo+ID4gPiAtIC9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJm
L0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QOiBjZCAuICYmIG1ha2UgRkVBVFVSRV9EVU1QX0NPUFk9
L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFU
VVJFX0RVTVAgIGZlYXR1cmUtZHVtcAo+ID4gPiBjZCAuICYmIG1ha2UgRkVBVFVSRV9EVU1QX0NP
UFk9L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9G
RUFUVVJFX0RVTVAgZmVhdHVyZS1kdW1wCj4gPiA+ICAgICAgICAgIG1ha2Vfbm9fbGliYmlvbmlj
X086IGNkIC4gJiYgbWFrZSBOT19MSUJCSU9OSUM9MSBGRUFUVVJFU19EVU1QPS9ob21lL2FjbWUv
Z2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1q
MjggTz0vdG1wL3RtcC5LWnVRMHEyVnM2IERFU1RESVI9L3RtcC90bXAuMHN4TXlIOTFnUwo+ID4g
PiAgICAgICAgICAgIG1ha2VfdXRpbF9tYXBfb19POiBjZCAuICYmIG1ha2UgdXRpbC9tYXAubyBG
RUFUVVJFU19EVU1QPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJmL0JV
SUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1qMjggTz0vdG1wL3RtcC5ZME14M0tMUkVJIERFU1RESVI9
L3RtcC90bXAud2c5SENWVkxIRQo+ID4gPiAgICAgICAgICAgICAgIG1ha2VfaW5zdGFsbF9POiBj
ZCAuICYmIG1ha2UgaW5zdGFsbCBGRUFUVVJFU19EVU1QPS9ob21lL2FjbWUvZ2l0L3BlcmYtdG9v
bHMtbmV4dC90b29scy9wZXJmL0JVSUxEX1RFU1RfRkVBVFVSRV9EVU1QIC1qMjggTz0vdG1wL3Rt
cC5QMExFQkFrVzFYIERFU1RESVI9L3RtcC90bXAuYWdUYXZabmRGTgo+ID4gPiAgIGZhaWxlZCB0
byBmaW5kOiBldGMvYmFzaF9jb21wbGV0aW9uLmQvcGVyZgo+ID4gCj4gPiBJcyB0aGlzIHNvbWV0
aGluZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2g/Cj4gCj4gSSBkb24ndCB0aGluayBzby4KPiAK
PiBCVFcgdGhpcyBzZXJpZXMgaXMgYWxyZWFkeSBwdXNoZWQgb3V0IHRvIHBlcmYtdG9vbHMtbmV4
dDoKPiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9w
ZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvbG9nLz9oPXBlcmYtdG9vbHMtbmV4dAo+IAo+IFRoYW5r
cyEKPiAKPiAtIEFybmFsZG8KClRoYW5rIHlvdSEKCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
