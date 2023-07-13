Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030B1C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TuCq1Y1KRURyEJEl6Tzn+RzowNcfjfv1FSOMcpZ5y+E=; b=4db3OY86w3hFYHWXqkYw4KvqkW
	CMb1gKPauDQts2aettu2n4TQWfdDFmn33q/KHdu/h2806KPfSYpmoJtbyKYQybgk54qzfocAtys5c
	TXPVKT+40hjofjfdvKvfQMwRcdyxUKSqFMZyN53XTsA3ntMSGffhPTzJGfrw+lBC9Fy6ygJe6rnLw
	HfR4G7PZsfBJNf/KnqNTSskWMMrD3S+5tyXhev/bUgQ83Rm+/gVga2pT1kt85+WAPXBLDCXZ4fybl
	fIDZCtGMdJ22wI/AY1/1H+W460UynBBLeuC8bzyHB0lYnvJaOrWIWIQaO2/13A/jIlVjvQKPlT/no
	FpfqvCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzcN-003yHH-0k;
	Thu, 13 Jul 2023 16:56:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzcJ-003yFm-1r
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 16:56:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6686c74183cso986308b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689267395; x=1691859395;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XY9uupVWMcncRtRoM69yP/SGlq46AcVDeVR1GDRFMqs=;
        b=Cuo/pQNYUH08CjNv4ktys5+2EJekqZr6s98VOdJ5E2YL2hJ9V/5+3NTQ4jUtj8q17L
         PevogXTqibIfbbq7UooaW90eJnRHDMHEI1kimWUfL0Ne1CQRJd7MMRuhl9sghmZphD3p
         whnrf/5/gvL5oar83jUr2Jn9X1lTykNf8ByIURPIez5BxwoCpcPJfWvVOvQfCElZ2j+Y
         PqZwpDr5lu6Xf24jOdd7+u3w0xJdBD1BXTXeA8eD4RQU6/94Ff7Q0xditvpAacvPYDsO
         xIASkUlcsPxYcX5oU4aFd/NIUKuvB6pbv142i7psKl/yKIZ8FYHCQbt7z5hcCEmXdA5/
         997g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267395; x=1691859395;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XY9uupVWMcncRtRoM69yP/SGlq46AcVDeVR1GDRFMqs=;
        b=b0to1CWoGVpwTyzxqMiMHgmvn68CaWdTiYwL1zlc7bXGMdSIymSmd3vQrpX46xCRx4
         xiKmULGkTS797QUtidSD7EsS9wR3wNqiVaZo801TCy2Geh9qX6vQFPErd8uSkMfJY4E2
         ooRnmcwrsgH2f2jVD+1wp75gdUEzVn3j2Cxl824ea7/axdvD4hYmUiegrJi/+XaXVn8O
         7IqNHLc9plip6PXr+Wxo48Us3KvzOA6ddrTJ8RGB77U/PRh1Lo7bQKcxPgctj5lIoVFS
         r/WegxV99tU7vJ6E7tjI6gPmcMZsiC83yhu+CQ/+wa/0cYeLBYx+MJChw3EolIddXVIv
         DE/w==
X-Gm-Message-State: ABy/qLbB3tbyXXb67N8jPr1PmX/mqRfsp4HsSuRtM8hUEolBnsGYA0TW
	3bDG6V1hQXbgpcWspKNqHeQjMw==
X-Google-Smtp-Source: APBJJlE7B+7dyJYZuoPz8t3ghMR/3+Jr6BJywu3hGmwRs+XkwASsyln+4CCMS8UMgUcAbvT6s4BjLg==
X-Received: by 2002:a05:6a20:6a12:b0:11c:fc27:cda4 with SMTP id p18-20020a056a206a1200b0011cfc27cda4mr2211381pzk.11.1689267394776;
        Thu, 13 Jul 2023 09:56:34 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id z186-20020a6333c3000000b0055c656ef91asm5112853pgz.77.2023.07.13.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 09:56:34 -0700 (PDT)
Date: Thu, 13 Jul 2023 09:56:34 -0700 (PDT)
X-Google-Original-Date: Thu, 13 Jul 2023 09:55:44 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property on T-Head CPUs
In-Reply-To: <ZLAoIWX+qqWvucWz@xhacker>
CC: Conor Dooley <conor@kernel.org>, guoren@kernel.org,
  Heiko Stuebner <heiko@sntech.de>, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jszhang@kernel.org
Message-ID: <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_095635_803188_F7EB2691 
X-CRM114-Status: GOOD (  30.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Jul 2023 09:36:49 PDT (-0700), jszhang@kernel.org wrote:
> On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> The last merge window contained both V support and the deprecation of
>> the riscv,isa DT property, with the V implementation reading riscv,isa
>> to determine the presence of the V extension.  At the time that was the
>> only way to do it, but there's a lot of ambiguity around V in ISA
>> strings.  In particular, there is a lot of firmware in the wild that
>> uses "v" in the riscv,isa DT property to communicate support for the
>> 0.7.1 version of the Vector specification implemented by T-Head CPU
>> cores.
>
> Add Guo
>
> Hi Conor, Palmer,
>
> FWICT, new T-HEAD's riscv cores such as C908 support standard RVV-1.0,
> this patch looks like a big hammer for T-HEAD. I do understand why

Ya, it's a big hammer.  There's no extant systems with the C908, though, 
and given that the C906 and C910 alias marchid/mimplid it's kind of hard 
to trust any of those values for T-Head systems.  We could check for the 
0s and hope T-Head starts setting something else, but I'm not sure 
that's a net win (we've also got the C920 in the Sophgo chip, which IIUC 
is V-0.7.1 too).

> this patch is provided, but can we mitigate the situation by carefully
> review the DTs? Per my understanding, dts is also part of linux kernel.

That would break compatibility with existing firmware.  It's certainly 
something that has happened before, but we try to avoid it where 
possible.

In this case new T-Head systems that have standard V would just need to 
provide the new DT properties instead of the ISA string property.  We've 
deprecated the ISA string property already so that's what new systems 
should be doing anyway, and given that this only applies to new systems 
it doesn't seem like a big ask.

> Thanks
>
>>
>> Rather than forcing use of the newly added interface that has strict
>> meanings for extensions to detect the presence of vector support, as
>> that would penalise those who have behaved, only ignore v in riscv,isa
>> on CPUs that report T-Head's vendor ID.
>>
>> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Changes in v2:
>> - Use my version of the patch that touches hwcap and isainfo uniformly
>> - Don't penalise those who behaved
>> ---
>>  arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index bdcf460ea53d..05362715e1b7 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -21,6 +21,7 @@
>>  #include <asm/hwcap.h>
>>  #include <asm/patch.h>
>>  #include <asm/processor.h>
>> +#include <asm/sbi.h>
>>  #include <asm/vector.h>
>>
>>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>> @@ -334,6 +335,27 @@ void __init riscv_fill_hwcap(void)
>>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>>  		}
>>
>> +		/*
>> +		 * "V" in ISA strings is ambiguous in practice: it should mean
>> +		 * just the standard V-1.0 but vendors aren't well behaved.
>> +		 * Many vendors with T-Head CPU cores which implement the 0.7.1
>> +		 * version of the vector specification put "v" into their DTs
>> +		 * and no T-Head CPU cores with the standard version of vector
>> +		 * are in circulation yet.
>> +		 * Platforms with T-Head CPU cores that support the standard
>> +		 * version of vector must provide the explicit V property,
>> +		 * which is well defined.
>> +		 */
>> +		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID) {
>> +			if (of_property_match_string(node, "riscv,isa-extensions", "v") >= 0) {
>> +				this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
>> +				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
>> +			} else {
>> +				this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
>> +				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>> +			}
>> +		}
>> +
>>  		/*
>>  		 * All "okay" hart should have same isa. Set HWCAP based on
>>  		 * common capabilities of every "okay" hart, in case they don't
>> --
>> 2.39.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
