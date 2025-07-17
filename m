Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C8C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXRyHpmWAeIxrv81ysC4kWgWzQbsv2ynsRPR4PveprI=; b=Qxxr1FyUF10My7
	iWGaS+hFyin26ILTtbk9KyqJ9xFl4i6fYyIdB1+DAQwNI0L0RrjsmFTg1Hot10TPc12OCyiEN7et4
	alP9d5/uZ4aoq6VRr/SjA0CnBBDqSlfeUdcXlE0hpsE6pZ+ZfzJdCzdlGYpcdiLOY3b+5kjJq/cuy
	/sV1VV/Lyar6aTcjFMBPousLXiIQrUE6Yc59XG2seEeGourRIukfPMUTFxVBtpk3s02Fpen5EGlxD
	ogmuOzL7OgKtfaXJpHq/Ecfa5Wf2vTEZIeMPKbjvGjCQCUr2PSbttp3Q27t4NXq0IXnyM1oaA1U04
	4YmdKisg0nxV3CfUUxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR38-0000000AZMv-2yvS;
	Thu, 17 Jul 2025 16:01:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQOE-0000000AUmL-3ohZ
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=; b=TigRB03GIqPfurdXvmA9SlqXxo
	HUc+ohpD3yn1P3mztW4Wj+h+KO8RuWi60++byycOs0KR+gZIVHOyC81cypu+4syauz/+4BROVKTDL
	V08vWUtH0k3U4at+6ujv6aqnQLcvqC9ixKVSpPjdSWQ5Iks6bSqE+X8ieDBMcBiEtZrXwRlrigIYl
	mYN0cbNy3tPCDcrD0+wrY9fRWlv1tPkwKnsRpImorocaUtN1V61l6Vl5RsYNbwKkbKHknFt0Xh9G2
	PVVsT9K6sKz0YRY/XiH2ZeJsH+13YtLAs9+ovrFQk2tmYOwj552beh9HBi0bTYLN796RGeA6kPugu
	/rVEw0Gg==;
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQOA-0000000AIbM-2x9c
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:19:17 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7e32c95778aso58003285a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765552; x=1753370352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=;
        b=cI8t/Z8YnKxF/khvfB8kgK+dIjxq3dCwJfhwEJKzkH3ac8W4gfd2Mq2h0ydV890Bpi
         h0PzFJOZPo7cmN20+4YS/gv5GpjpQ4d2EdNWlsH9YjzhqErqx60CsQrskJ5m7rgjlcEX
         phEm7eeAcv54/4WU/Ya1PNvjabqsAjKSyYiDCjBlDEnhkQlU+zfnMQrXnJd7QmSniNEh
         0mD7yA1v+rl9naBCOfDLyro/7lgk+SDTcf/qC+HP7g+Q67qbWRlVfrvx7xwMEHZhwGz/
         +6dk1Y1bkLme7yhgUJYYickurdEtSOTnb50/UCFLZbzcj59sNQzpDgoaFEUpS22HSkEg
         ToHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765552; x=1753370352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5xUBrBCpzFPT/Ceifws++OIUGJp175GJMu2Bn4O4tU=;
        b=X+JdAHDmgHCmb7SQ2hSkgD4R7f206uU0D9Ar+2QucLCZmgyyPVK0k+knNforJHBeC1
         1YGoUV19+LogEoBQXmH7npLtg1yPxYxQEE/ozIIAAqwDRs6qu70dXiQqhn3OBvs2jDlv
         8JqG+/dyk6MspQr7fajKeWSQuF2WAdXY+myYQ8LxGaEo1XI1d7NQ+S4nv9GGEXQCF7xa
         uXKs5CzkV4JMoOAEfTkY82EiJKyWxNPl0wnyZssa8vrIIyqJA88qkPLb4GMzYJidOzf1
         VDmBYpXofwDGl9jB2iPyDS01T+Fn3LKPBxu5lPSFNL1AwXlrJ4CQcyglWCZiBjVT6XPt
         xxxA==
X-Forwarded-Encrypted: i=1; AJvYcCXPB4BzhA6lj9saFZ9bI1mY1pnyjNum7FpWmtqTBMx0+9qixfXj/JxPWVMDvHF44SO8C3vqsgcrGflx8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVeeLa5FBr2pep2oXzcr6OxWSYKc1ZVypPdID8oQBxP2vjYLlL
	u0QubP7hdYJ46CgVyQf2wdsYB+WO+cROTG+JVI7B/1m115TISIM8hbwvVUA4VeqNtVpIPPBKYxN
	iCC24vvg0hTLDhFEv9a8ULnAJae7VFIxVcti1lL7ztg==
X-Gm-Gg: ASbGnctdk5z36zH8PGrS/MGnej6jdslK8z7J2R8vdjEuh3gRC9b9S+w+jR6eUjh/84E
	QPsHFGAiJaIGmu9XK+HYiAtMXTohFV31HYrFR+an8fAAg2FTbrwKAsZk7mmW5ruLw9d9n44hYyW
	a+7tFSxZR/V9Y7s/pjA83rvBNC5w+a75WBXmSbM8gEdYhwGMUPlmioJj6/K4C0LqgprddVlN/bV
	5hnxAkJ
X-Google-Smtp-Source: AGHT+IE3X2vck2pgSl2t6KFn5NgHq0p0Hh8fU3rZDbhsrXFgiaKsssOSMAr59vMNLRAJb0iXVxOVbhMl8sP6UXRX7pU=
X-Received: by 2002:a05:620a:1794:b0:7e3:320b:437 with SMTP id
 af79cd13be357-7e343351613mr1118889785a.1.1752765551906; Thu, 17 Jul 2025
 08:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:48:58 +0530
X-Gm-Features: Ac12FXyPbawu-s2Ss3H3yKP5ugd9T6IetcEyIWyv14Bbl9oa3EI2UsBfWrZcDw8
Message-ID: <CAAhSdy304FBYo-3TZyNhKqtDsUSnW+B=U3ktR5JHLr9+LLqXEg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_161914_868539_28CE1906 
X-CRM114-Status: GOOD (  16.00  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQkkgdjMuMCBpbnRyb3VjZWQgYSBuZXcgcmF3IGV2ZW50
IHR5cGUgdjIgZm9yIHdpZGVyIG1ocG1ldmVudFgKCnMvaW50cm91Y2VkL2ludHJvZHVjZWQvCgo+
IHByb2dyYW1taW5nLiBBZGQgdGhlIHN1cHBvcnQgaW4ga3ZtIGZvciB0aGF0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggNzhhYzMyMTZhNTRkLi4xNWQ3MWE3Yjc1YmEg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtNjAsNiArNjAsNyBAQCBzdGF0aWMgdTMyIGt2bV9wbXVf
Z2V0X3BlcmZfZXZlbnRfdHlwZSh1bnNpZ25lZCBsb25nIGVpZHgpCj4gICAgICAgICAgICAgICAg
IHR5cGUgPSBQRVJGX1RZUEVfSFdfQ0FDSEU7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgY2FzZSBTQklfUE1VX0VWRU5UX1RZUEVfUkFXOgo+ICsgICAgICAgY2FzZSBTQklfUE1V
X0VWRU5UX1RZUEVfUkFXX1YyOgo+ICAgICAgICAgY2FzZSBTQklfUE1VX0VWRU5UX1RZUEVfRlc6
Cj4gICAgICAgICAgICAgICAgIHR5cGUgPSBQRVJGX1RZUEVfUkFXOwo+ICAgICAgICAgICAgICAg
ICBicmVhazsKPiBAQCAtMTI4LDYgKzEyOSw5IEBAIHN0YXRpYyB1NjQga3ZtX3BtdV9nZXRfcGVy
Zl9ldmVudF9jb25maWcodW5zaWduZWQgbG9uZyBlaWR4LCB1aW50NjRfdCBldnRfZGF0YSkKPiAg
ICAgICAgIGNhc2UgU0JJX1BNVV9FVkVOVF9UWVBFX1JBVzoKPiAgICAgICAgICAgICAgICAgY29u
ZmlnID0gZXZ0X2RhdGEgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBTQklfUE1VX0VWRU5UX1RZUEVfUkFXX1YyOgo+ICsg
ICAgICAgICAgICAgICBjb25maWcgPSBldnRfZGF0YSAmIFJJU0NWX1BNVV9SQVdfRVZFTlRfVjJf
TUFTSzsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9QTVVfRVZF
TlRfVFlQRV9GVzoKPiAgICAgICAgICAgICAgICAgaWYgKGVjb2RlIDwgU0JJX1BNVV9GV19NQVgp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29uZmlnID0gKDFVTEwgPDwgNjMpIHwgZWNvZGU7
Cj4KPiAtLQo+IDIuNDMuMAo+CgpPdGhlcndpc2UsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
