Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B226BEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 01:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/LT7pz61uSTRxO9im63TZ5+6tHhtX3QFhKw33zCUb6U=; b=lJIFNJTzsPt4Gj7LwOnI3Yw1lZ
	4YrMTpyGsEJkYLUeoo7QYE4X6DbUqy6OcfdYktTH3mjSn8J3vkU20KR4lRrd8sxergQDguYIOVx71
	M8g+FlxxgrHUDbgLgGNsS4UgqPV+0zjjK5p98hDt+Ax6Ffn8SvXZ1nwgFg0gpRyL7nYWySAnx4Fzg
	yxntW8YyeM5Zn8DeAuUAFIRq3+LygeBxBbfs4bZ9ykdeR8+9tBldTiDN02QRY9emN5GQH2OWKSHKb
	DQ0knq+sCwLyVJy+5cE+5TT3XNoU1S0joRn0AWrA7xNGyn657+YoZUMjPQE06vsdKnDGmJk6F27BH
	dNYVRaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEKQA-00EY1e-11;
	Wed, 28 Jun 2023 01:56:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEKQ5-00EY0d-1q
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 01:56:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b7fb1a82c4so20507215ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 18:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687917391; x=1690509391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Cd/G7/Im6qRuywIaizS4WiK3piIElyerw+hFayCjhc=;
        b=blWTk18r6RBs8QioLBPExCIBzB3ccRZ623Cad7klNG93TJsUgKUMzWCgAl2tV0Ng63
         w2eRGA6EDird05tCuBu516E3WnLGGMymdfeXum6GLnQAC2Fez66HBXYV3tcfyEZQHWxm
         mxgTXZMBc8s0hrlxaCa23e0bVQ1Yfa8EbxPWJ0FinE1OFdVXz/LPTHNLQDp3jqQD2jM5
         57u/iU9mkHCa4aRFHN8i6R0sFDgOPrWJB4vFF4lIut7sCROkoakGtSN2oHM+msZcjL0b
         oWXFEF1JODW89N1t75p3TcWrffMtYvI25YDA9ZgaXD+Phhw9Aj5q+fwR3zfwMHTCzpvE
         jTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687917391; x=1690509391;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Cd/G7/Im6qRuywIaizS4WiK3piIElyerw+hFayCjhc=;
        b=X6/Sx6b42kd13wfMLWBm/6V7HsDjrQdkIe7TELAmxfN64O/B8ckfCsi894bGVeUKe4
         uU2KSMv3r9JAPEH4dS3fAhzkbmB18IEdZfI2XvaZNBK9eB6AUMbjcNZLLiS2jTvoBLa/
         Z0T+GqE42PF5NQfML/GJAxF6X8rzQD+rjrcllIhLtob/VmihpVFEdBMRFpxhCUwCipQJ
         w/5mTSd5Ee5CvBPhkLx0VUeaVZW9IN3w27wOzLed+h9xSlE0Jmqud8eigdYBuaiSihzY
         EhN81wSZuM5yDRoCOSsaFAasdAGqa4LdGwvcp7Ir1Ai3sz8YSYKUlCDNtLNbE+lGNjxs
         yDxA==
X-Gm-Message-State: AC+VfDx4INVe049/iokDj4h9v7ROoxojMh4JNuWIYxDXLHEdkDSNr8Hj
	5oWeD+eZ2iAZPoKvOpcJDCCYDg==
X-Google-Smtp-Source: ACHHUZ58GyJha99BlISGLKvix5VrOdfHBzZg+foa3A15tt5s3k1KZNrsi+SA4yIHW/r87Fw+saC7jw==
X-Received: by 2002:a17:902:bd07:b0:1b7:e646:4cc4 with SMTP id p7-20020a170902bd0700b001b7e6464cc4mr7446569pls.28.1687917391102;
        Tue, 27 Jun 2023 18:56:31 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902da9200b001b03a1a3151sm6552494plx.70.2023.06.27.18.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 18:56:30 -0700 (PDT)
Date: Tue, 27 Jun 2023 18:56:30 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Jun 2023 18:56:27 PDT (-0700)
Subject: Re: [PATCH -next v21 03/27] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <8af3e53a-ead7-4568-a0f1-2829f5d174e6@app.fastmail.com>
CC: andy.chiu@sifive.com, linux-riscv@lists.infradead.org, anup@brainfault.org,
  atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, Evan Green <evan@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, coelacanthus@outlook.com, abrestic@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sorear@fastmail.com
Message-ID: <mhng-97928779-5d76-4390-a84c-398fdc6a0a4f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_185633_837298_AB8AD780 
X-CRM114-Status: GOOD (  37.03  )
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

On Tue, 27 Jun 2023 17:30:33 PDT (-0700), sorear@fastmail.com wrote:
> On Mon, Jun 5, 2023, at 7:07 AM, Andy Chiu wrote:
>> Probing kernel support for Vector extension is available now. This only
>> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>>
>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Changelog v20:
>>  - Fix a typo in document, and remove duplicated probes (Heiko)
>>  - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
>>    Evan)
>> ---
>>  Documentation/riscv/hwprobe.rst       | 3 +++
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_riscv.c         | 4 ++++
>>  3 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
>> index 9f0dd62dcb5d..7431d9d01c73 100644
>> --- a/Documentation/riscv/hwprobe.rst
>> +++ b/Documentation/riscv/hwprobe.rst
>> @@ -64,6 +64,9 @@ The following keys are defined:
>>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
>>      by version 2.2 of the RISC-V ISA manual.
>>
>> +  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
>> +    version 1.0 of the RISC-V Vector extension manual.
>> +
>>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>>    information about the selected set of processors.
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h
>> b/arch/riscv/include/uapi/asm/hwprobe.h
>> index 8d745a4ad8a2..7c6fdcf7ced5 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -25,6 +25,7 @@ struct riscv_hwprobe {
>>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>>  #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>>  #define		RISCV_HWPROBE_IMA_C		(1 << 1)
>> +#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>> diff --git a/arch/riscv/kernel/sys_riscv.c
>> b/arch/riscv/kernel/sys_riscv.c
>> index 5db29683ebee..88357a848797 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -10,6 +10,7 @@
>>  #include <asm/cpufeature.h>
>>  #include <asm/hwprobe.h>
>>  #include <asm/sbi.h>
>> +#include <asm/vector.h>
>>  #include <asm/switch_to.h>
>>  #include <asm/uaccess.h>
>>  #include <asm/unistd.h>
>> @@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe
>> *pair,
>>  		if (riscv_isa_extension_available(NULL, c))
>>  			pair->value |= RISCV_HWPROBE_IMA_C;
>>
>> +		if (has_vector())
>> +			pair->value |= RISCV_HWPROBE_IMA_V;
>> +
>>  		break;
>
> I am concerned by the exception this is making.  I believe the intention of
> riscv_hwprobe is to replace AT_HWCAP as the single point of truth for userspace
> to make instruction use decisions.  Since this does not check riscv_v_vstate_ctrl_user_allowed,
> application code which wants to know if V instructions are usable must use
> AT_HWCAP instead, unlike all other extensions for which the relevant data is
> available within the hwprobe return.

I guess we were vague in the docs about what "supported" means, but IIRC 
the goal was for riscv_hwprobe() to indicate what's supported by both 
the HW and the kernel.  In other words, hwprobe should indicate what's 
possible to enable -- even if there's some additional steps necessary to 
enable it.

We can at least make this a little more explicit with something like

    diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
    index 19165ebd82ba..7f82a5385bc3 100644
    --- a/Documentation/riscv/hwprobe.rst
    +++ b/Documentation/riscv/hwprobe.rst
    @@ -27,6 +27,13 @@ AND of the values for the specified CPUs. Usermode can supply NULL for cpus and
     0 for cpu_count as a shortcut for all online CPUs. There are currently no flags,
     this value must be zero for future compatibility.
     
    +Calls to `sys_riscv_hwprobe()` indicate the features supported by both the
    +kernel and the hardware that the system is running on.  For example, if the
    +hardware supports the V extension and the kernel has V support enabled then
    +`RISCV_HWPROBE_KEY_IMA_EXT_0`/`RISCV_HWPROBE_IMA_V` will be set even if the V
    +extension is disabled via a userspace-controlled tunable such as
    +`PR_RISCV_V_SET_CONTROL`.
    +
     On success 0 is returned, on failure a negative error code is returned.
     
     The following keys are defined:
    @@ -65,7 +72,10 @@ The following keys are defined:
         by version 2.2 of the RISC-V ISA manual.
     
       * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
    -    version 1.0 of the RISC-V Vector extension manual.
    +    version 1.0 of the RISC-V Vector extension manual.  For strict uABI
    +    compatibility some systems may disable V by default even when the hardware
    +    supports in, in which case users must call `prctl(PR_RISCV_V_SET_CONTROL,
    +    ...` to explicitly allow V to be used.
     
       * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
            supported, as defined in version 1.0 of the Bit-Manipulation ISA

IMO that's the better way to go that to require that userspace tries to enable
V via the prctl() first, but we haven't released this yet so in theory we could
still change it.

We'd have a similar discussion for some of the counters that need to feed
through the perf interface, though those are still in flight...

> Assuming this is intentional, what is the path forward for future extensions
> that cannot be used from userspace without additional conditions being met?
> For instance, if we add support in the future for the Zve* extensions, the V
> bit would not be set in HWCAP for them, which would require library code to
> use the prctl interface unless we define the hwcap bits to imply userspace
> usability.

In this case a system that supports some of the Zve extensions but not 
the full V extension would not be probably from userspace, as V would 
not be set anywhere.  The way to support that would be to add new bits 
into hwprobe to indicate those extensions, it just wasn't clear that 
anyone was interested in building Linux-flavored systems that supported 
only some a strict subset of V.

Happy to see patches if you know of some hardware in the pipeline, though ;)

>
> -s
>
>>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
>> --
>> 2.17.1
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
