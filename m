Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E1FC9833F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwuiY3TQ8stp0qPLcWkWD2LnVi11FM9c6Q/dvxY+hoI=; b=VyQgNKQ3sYEgmx
	n+2XcI45SID41U42x2bnATtGNaCRNqrn5MXZIVSjSL/3sjmJrJjlg7ISBzp4ErCp/fB3nBmQcUsUj
	KgVPFPpR5Sxoo/N2nuJQVIMgp3l3N/HBLcvsTL5Dqz6QDJc/SFayPAjEq/FzwnexVun5vgYEKWz40
	QvOsBdk2MfkmV2CXonEkbFVPwudkLj9ddG2IljmWfszdlTZEx/+Qyj815VYZUH9zO3bn7XG5WoIn+
	LhWQ7ar8V5X88PiRBgGMd6BgtAr2vpT0mu6um2Ql/lytizhzKb83BDFtozKqErl/4dWyyLxPf5Jz8
	p1mtOlUMm8gTChzLoa9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBdD-00000000gfb-19FN;
	Mon, 28 Sep 2026 13:42:59 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBd2-00000000gZQ-02xc
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:53 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4888129c46eso1639504f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 06:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602966; cv=none;
        d=google.com; s=arc-20260327;
        b=Jdd78ZUcjyeCYlI6T1WOasP1kTE6D8g+eViW4fWGBKY9dk9XPLQLq98XoCOXmUhAOr
         iEAneHXuqIar94LTr6D6agYlOh0T0y8dMoaAgwcxgp1N57Ec0ShVDr4sOOQwktCeLw/n
         9RbAZQqyt2NJGU2LrjRwemx8sSNptdzhmEFSqhG1C02Ob5rxXCTEqlY9ptu/jjNr/GCa
         7thOemTbc5f+wXayuTy/2MbtWKtDad8oGDvK0+PLas5Q9NpDf4sFXkE87bP6qxU3MM2X
         jqWOlI/2UgaqONtboJpo5PQRqcz+8Cp49z/1q00JocCyp1Om/4owcy94GaYS7I8sK/ZP
         a4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        fh=DxvTNvkyUS9xcogsup8uiVhiYs00gIvCPVi7ouvCpHk=;
        b=egAen8Gzd/ioZL4q92gboWqE3ytVYPm4sI1LhXPpth2+lZr7g5PcAKzy/IoTIvXAJK
         nXq1pMMpwdQwcLoxt0oiIoSDDJ1Fulqj10ofzuAikAf+10qJVYDGPlWPU9B7AB1+9UWR
         0q/OBfR9wHu/RWv0TX7vAwYS4SIyb5BFOTU6uJ6wpdxOXdWcBxrgX6VMxlArYKYe5NYm
         fe1xKQOkKSBY5pWflzkkDILfuFvoQcQeF1DKLXCb2j2sgU3rXdZEVCWc2N7WJVtf6BaE
         pDLI07cQz1r8xLb63Gw6H9mFM9wx8sqamNzT+z7us488s39EJpqL3PE9PbigWDSbC9Em
         B6BA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602966; x=1791207766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        b=qkefbo1ozjS/j8uOFJ76rR2TKhm37K1I3qyzUKD29DXvHbXh0I4gKc0Zdl8hO0JLZU
         lZnbwEbrM9yI90pkDyMzANu5q3SOW4DDFSmY0vDO1i79sUYqqOCZ550zXE8ALg3oHEUr
         Sr61x4NUO98kwC9rjgoiIjrHFmpowPqpWt2PDPFfhxuBQYkfBoa3tNtFClkwUuHvBMiE
         Q5JatLLqj0a1ZHW261qJz8S7bDdxsp+L9KMGGVgwNEh9VIVaNZZ8e+Pb3i9+IiJDsNm4
         EdkFM4rAw2Ja+rQ1B5IPeMUOy7pVKaU4xq8rNq/CBv8OMltw5ITzULBvDqSIHafzoBFk
         drMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602966; x=1791207766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        b=Y4UfnQJEngj9uQT7KFvXh4GC4XINLrbDMgcpeZOgXhH9W8t28rNDj4oCpkX3KD7Nbp
         b1IOjRhtj3C/f09ZFPBrDINyjIpARdmMEUvFyCZKo6ERmlNWysmEUd2WiyuN0O4JRahg
         4NL6bE13gpczkJo6KSCj19IFzPyM5ZpXlBHflLKfTpdBzFWKmEuXdAs1cRCWsESU4eZK
         +x2VT3LgkjMyM1HHaAMAk32MFth3kjsE0QDTJpZex0O0FD2jvXISvUxS7q1MA8v6VGSe
         6sz8Ap7ODyOgLptZJnyyg/fMpWUHuIMo3BjH2lN0JOURCYk62WBWsyA/5MHIYodLd1oA
         fCvA==
X-Forwarded-Encrypted: i=1; AKwUvBzo0bmYBP4hh9KtS56HtpZlqL6LuQ8/tP/KOTE8KbQRCJSmhl+UlyZya5B7yAU3iwiY+lUy1jUWdCHdMw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKAQCH6iipBwKeDp7VdQgorD0s/gh0D6BvcaH2e6/Rwca+rfOQC
	WJfdsh8Gy+zig+iYgEjMAixG3US3TQjD0OWYXlzs03eqLvrVU9on9HH8Uhgg1XYTptJOx2oHAI5
	diTCEDLg4J5xJF5x/1zi1RTIGc56038YQ3Fzih6qy8g==
X-Gm-Gg: AYBFou2niYFq5ajo9/yVB9QEQAlhUjSHvunqU9XEObKUxIjdc4xRzrejb8nixDbXPTs
	FMlR9nw1ytJEw4J0xA7YRsdODImthDnHHP3MnQfmssJ4bOhlAZp1LZdfHNOTYNnnzibdhZFsS+A
	X1wgovZIa4RPDysWj9tqsrB1/HKzSXv9IHRjGPUGtPGyhMZM4Go4sYrZ0LlylTUdDCRInEiUOlS
	GEzVyW/wa9ocXOYW08ldbU5Lf1KoYrEAJYavAhTKjgF1pt9F+gJRZIAukkkY9OZ9kCPhItbNI4V
	qsU5phEjgof8wNlWyLKlgIW3VMNoAbRfbcIxKM3G8j9cY9t6O6Zb2EcJZoDlVlD255lyiyAUjcL
	L8igJxaOMDaFmMcw2m0GpmmJfuBBZwCTq9ymUgNk3IGvsm2HLBmDv3VZdsKEyXFW14KP2pBAdLr
	E=
X-Received: by 2002:a5d:5d0e:0:b0:488:7f1d:2735 with SMTP id
 ffacd0b85a97d-4887f1d288amr19321423f8f.57.1790602965883; Mon, 28 Sep 2026
 06:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260928094739.2605-3-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:12:33 +0530
X-Gm-Features: AclHuK-74TWd3BjhOYFsGW8F1pliz-aGiiWKp_r2qgxigINlZVJkaGpvr4QoqNI
Message-ID: <CAAhSdy0n7P+UP8M7pge7PHp_aifSsxqcsh8ahTEYjfUO8wengw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support check
 with a weak hook
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
	will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064248_099482_269D63E4 
X-CRM114-Status: GOOD (  28.33  )
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMzoxOOKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gVGhlICJUU0Mgc3VwcG9ydCIgc3VidGVzdCBvZiB0aGUg
IkNvbnZlcnQgcGVyZiB0aW1lIHRvIFRTQyIgdGVzdCBkZWNpZGVzCj4gd2hldGhlciB0aGUgYXJj
aGl0ZWN0dXJlIGlzIGNvdmVyZWQgYnkgbWF0Y2hpbmcgY29tcGlsZXIgbWFjcm9zIGZvcgo+IHg4
Nl82NCwgaTM4NiBhbmQgYXJtNjQuICBUaGF0IGxpc3QgaGFzIHRvIGJlIGVkaXRlZCBmb3IgZXZl
cnkgbmV3Cj4gYXJjaGl0ZWN0dXJlLCBhbmQgaXQgY2FuIGRyaWZ0IGFwYXJ0IGZyb20gdGhlIHNl
dCBvZiBhcmNoaXRlY3R1cmVzIHRoYXQKPiByZWFsbHkgcHJvdmlkZSBhIGNvdW50ZXI6IHV0aWwv
dHNjLmMgYWxyZWFkeSBzaGlwcyBhIHdlYWsgcmR0c2MoKSB3aGljaAo+IGFuIGFyY2hpdGVjdHVy
ZSBvdmVycmlkZXMgd2l0aCBhIHN0cm9uZyBkZWZpbml0aW9uIHdoZW4gaXQgaGFzIG9uZS4KPgo+
IEFkZCBhIHdlYWsgYXJjaF9fcmR0c2Nfc3VwcG9ydGVkKCkgbmV4dCB0byB0aGUgd2VhayByZHRz
YygpLCBsZXQgdGhlCj4gdGVzdCBxdWVyeSBpdCBpbnN0ZWFkIG9mIHRoZSBtYWNyb3MsIGFuZCBo
YXZlIHg4NiwgYXJtNjQgYW5kIHJpc2N2Cj4gb3ZlcnJpZGUgaXQgaW4gdGhlIGZpbGUgd2hlcmUg
dGhleSBpbXBsZW1lbnQgcmR0c2MoKS4gIFN1cHBvcnQgaXMgdGhlbgo+IGRlY2xhcmVkIG5leHQg
dG8gdGhlIGNvdW50ZXIgaXQgZGVzY3JpYmVzLCBhbmQgYSBjYWxsZXIgY2FuIHRlbGwgYSBzdHVi
Cj4gYXBhcnQgZnJvbSBhIHJlYWwgY291bnRlciB3aXRob3V0IGtlZXBpbmcgaXRzIG93biBjb3B5
IG9mIHRoZSBtYWNybwo+IGxpc3QuICBUaGlzIGZvbGxvd3MgdGhlIHBhdHRlcm4gb2YgdGhlIG90
aGVyIG9wdGlvbmFsIHBlci1hcmNoaXRlY3R1cmUKPiBob29rcyBpbiB1dGlsLyBzdWNoIGFzIGdl
dF9jcHVpZF9zdHIoKS4KPgo+IHg4NiBhbmQgYXJtNjQga2VlcCB0aGUgc2FtZSBiZWhhdmlvdXIs
IGFuZCByaXNjdiBzdGFydHMgcnVubmluZyB0aGUKPiBzdWJ0ZXN0IGJlY2F1c2UgaXQgZ2FpbmVk
IHJkdHNjKCkgaW4gdGhlIHByZXZpb3VzIHBhdGNoLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQ
ZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KCkxHVE0gZnJvbSBSSVNDLVYgcGVyc3BlY3Rp
dmUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2Fy
ZHMsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3BlcmYvYXJjaC9hcm02NC91dGlsL3RzYy5jICAgIHwg
IDUgKysrKysKPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvdHNjLmMgICAgfCAgNSArKysr
Kwo+ICB0b29scy9wZXJmL2FyY2gveDg2L3V0aWwvdHNjLmMgICAgICB8ICA1ICsrKysrCj4gIHRv
b2xzL3BlcmYvdGVzdHMvcGVyZi10aW1lLXRvLXRzYy5jIHwgMTIgKy0tLS0tLS0tLS0tCj4gIHRv
b2xzL3BlcmYvdXRpbC90c2MuYyAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCj4gIHRvb2xz
L3BlcmYvdXRpbC90c2MuaCAgICAgICAgICAgICAgIHwgIDEgKwo+ICA2IGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvYXJjaC9hcm02NC91dGlsL3RzYy5jIGIvdG9vbHMvcGVyZi9hcmNoL2FybTY0L3V0aWwv
dHNjLmMKPiBpbmRleCBjYzg1YmQ5ZTczZjEuLmZkN2ZiYTUwZDBhNiAxMDA2NDQKPiAtLS0gYS90
b29scy9wZXJmL2FyY2gvYXJtNjQvdXRpbC90c2MuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9h
cm02NC91dGlsL3RzYy5jCj4gQEAgLTE5LDMgKzE5LDggQEAgdTY0IHJkdHNjKHZvaWQpCj4KPiAg
ICAgICAgIHJldHVybiB2YWw7Cj4gIH0KPiArCj4gK2Jvb2wgYXJjaF9fcmR0c2Nfc3VwcG9ydGVk
KHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL3RzYy5jIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0
aWwvdHNjLmMKPiBpbmRleCA3Y2M0NzEwYWMzOGMuLjMxMmIwYzc1NTQzOSAxMDA2NDQKPiAtLS0g
YS90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC90c2MuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJj
aC9yaXNjdi91dGlsL3RzYy5jCj4gQEAgLTE3LDMgKzE3LDggQEAgdTY0IHJkdHNjKHZvaWQpCj4K
PiAgICAgICAgIHJldHVybiB2YWw7Cj4gIH0KPiArCj4gK2Jvb2wgYXJjaF9fcmR0c2Nfc3VwcG9y
dGVkKHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3BlcmYvYXJjaC94ODYvdXRpbC90c2MuYyBiL3Rvb2xzL3BlcmYvYXJjaC94ODYvdXRp
bC90c2MuYwo+IGluZGV4IDNhNDM5ZTRiMTJkMi4uNmMwMWU5NmI1YzJlIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3BlcmYvYXJjaC94ODYvdXRpbC90c2MuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC94
ODYvdXRpbC90c2MuYwo+IEBAIC0xNyw2ICsxNywxMSBAQCB1NjQgcmR0c2Modm9pZCkKPiAgICAg
ICAgIHJldHVybiBsb3cgfCAoKHU2NCloaWdoKSA8PCAzMjsKPiAgfQo+Cj4gK2Jvb2wgYXJjaF9f
cmR0c2Nfc3VwcG9ydGVkKHZvaWQpCj4gK3sKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4g
Kwo+ICAvKgo+ICAgKiBEZXJpdmUgdGhlIFRTQyBmcmVxdWVuY3kgaW4gSHogZnJvbSB0aGUgL3By
b2MvY3B1aW5mbywgZm9yIGV4YW1wbGU6Cj4gICAqIC4uLgo+IGRpZmYgLS1naXQgYS90b29scy9w
ZXJmL3Rlc3RzL3BlcmYtdGltZS10by10c2MuYyBiL3Rvb2xzL3BlcmYvdGVzdHMvcGVyZi10aW1l
LXRvLXRzYy5jCj4gaW5kZXggZjhmNzFmZGQzMmIxLi5jOTFlMjJkOTNiNTMgMTAwNjQ0Cj4gLS0t
IGEvdG9vbHMvcGVyZi90ZXN0cy9wZXJmLXRpbWUtdG8tdHNjLmMKPiArKysgYi90b29scy9wZXJm
L3Rlc3RzL3BlcmYtdGltZS10by10c2MuYwo+IEBAIC0yMiwxNiArMjIsNiBAQAo+ICAjaW5jbHVk
ZSAidGVzdHMuaCIKPiAgI2luY2x1ZGUgInV0aWwvc2FtcGxlLmgiCj4KPiAtLyoKPiAtICogRXhj
ZXB0IHg4Nl82NC9pMzg2IGFuZCBBcm02NCwgb3RoZXIgYXJjaHMgZG9uJ3Qgc3VwcG9ydCBUU0Mg
aW4gcGVyZi4gIEp1c3QKPiAtICogZW5hYmxlIHRoZSB0ZXN0IGZvciB4ODZfNjQvaTM4NiBhbmQg
QXJtNjQgYXJjaHMuCj4gLSAqLwo+IC0jaWYgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVk
KF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQo+IC0jZGVmaW5lIFRTQ19JU19TVVBQ
T1JURUQgMQo+IC0jZWxzZQo+IC0jZGVmaW5lIFRTQ19JU19TVVBQT1JURUQgMAo+IC0jZW5kaWYK
PiAtCj4gICNkZWZpbmUgQ0hFQ0tfXyh4KSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ICAgICAgICAgd2hpbGUgKCh4KSA8IDApIHsgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
ICAgICAgICAgICAgcHJfZGVidWcoI3ggIiBmYWlsZWQhXG4iKTsgICAgICBcCj4gQEAgLTQ5LDcg
KzM5LDcgQEAKPiAgc3RhdGljIGludCB0ZXN0X190c2NfaXNfc3VwcG9ydGVkKHN0cnVjdCB0ZXN0
X3N1aXRlICp0ZXN0IF9fbWF5YmVfdW51c2VkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgc3VidGVzdCBfX21heWJlX3VudXNlZCkKPiAgewo+IC0gICAgICAgaWYgKCFU
U0NfSVNfU1VQUE9SVEVEKSB7Cj4gKyAgICAgICBpZiAoIWFyY2hfX3JkdHNjX3N1cHBvcnRlZCgp
KSB7Cj4gICAgICAgICAgICAgICAgIHByX2RlYnVnKCJUZXN0IG5vdCBzdXBwb3J0ZWQgb24gdGhp
cyBhcmNoaXRlY3R1cmVcbiIpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gVEVTVF9TS0lQOwo+
ICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvdHNjLmMgYi90b29scy9w
ZXJmL3V0aWwvdHNjLmMKPiBpbmRleCBlYmYyODliZjZiOWQuLjgxNTYyMWIxZDExMiAxMDA2NDQK
PiAtLS0gYS90b29scy9wZXJmL3V0aWwvdHNjLmMKPiArKysgYi90b29scy9wZXJmL3V0aWwvdHNj
LmMKPiBAQCAtMTEzLDYgKzExMywxNSBAQCB1NjQgX193ZWFrIHJkdHNjKHZvaWQpCj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+Cj4gKy8qCj4gKyAqIEFuIGFyY2hpdGVjdHVyZSB0aGF0IGltcGxl
bWVudHMgcmR0c2MoKSB3aXRoIGEgcmVhbCBjb3VudGVyIHNob3VsZCBvdmVycmlkZQo+ICsgKiB0
aGlzLCBzbyB0aGF0IHVzZXJzIG9mIHRoZSBjb3VudGVyIGNhbiB0ZWxsIGEgc3R1YiBhcGFydCBm
cm9tIHN1cHBvcnQuCj4gKyAqLwo+ICtib29sIF9fd2VhayBhcmNoX19yZHRzY19zdXBwb3J0ZWQo
dm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICBzaXplX3QgcGVy
Zl9ldmVudF9fZnByaW50Zl90aW1lX2NvbnYodW5pb24gcGVyZl9ldmVudCAqZXZlbnQsIEZJTEUg
KmZwKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcGVyZl9yZWNvcmRfdGltZV9jb252ICp0YyA9IChz
dHJ1Y3QgcGVyZl9yZWNvcmRfdGltZV9jb252ICopZXZlbnQ7Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3BlcmYvdXRpbC90c2MuaCBiL3Rvb2xzL3BlcmYvdXRpbC90c2MuaAo+IGluZGV4IDU3Y2U4NDQ5
NjQ3Zi4uODNlNzZiMjA3MzY1IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC90c2MuaAo+
ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC90c2MuaAo+IEBAIC0yNSw2ICsyNSw3IEBAIGludCBwZXJm
X3JlYWRfdHNjX2NvbnZlcnNpb24oY29uc3Qgc3RydWN0IHBlcmZfZXZlbnRfbW1hcF9wYWdlICpw
YywKPiAgdTY0IHBlcmZfdGltZV90b190c2ModTY0IG5zLCBzdHJ1Y3QgcGVyZl90c2NfY29udmVy
c2lvbiAqdGMpOwo+ICB1NjQgdHNjX3RvX3BlcmZfdGltZSh1NjQgY3ljLCBzdHJ1Y3QgcGVyZl90
c2NfY29udmVyc2lvbiAqdGMpOwo+ICB1NjQgcmR0c2Modm9pZCk7Cj4gK2Jvb2wgYXJjaF9fcmR0
c2Nfc3VwcG9ydGVkKHZvaWQpOwo+ICB1NjQgYXJjaF9nZXRfdHNjX2ZyZXEodm9pZCk7Cj4KPiAg
c2l6ZV90IHBlcmZfZXZlbnRfX2ZwcmludGZfdGltZV9jb252KHVuaW9uIHBlcmZfZXZlbnQgKmV2
ZW50LCBGSUxFICpmcCk7Cj4gLS0KPiAyLjUwLjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
