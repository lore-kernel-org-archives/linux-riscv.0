Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=90Bvrv9cHIjlv7Ria5/sAUkqK6VvknvSH5pIfvVwhYA=; b=mHyaRFHNTkEUaNhF6+sbgsJkW3
	eYHlp1jlKRcabFV6Cma2R+NPflxClVH7u4/asoBjx8dEyWR4dqFS1uQFn39NB7yNLC7TXV3ia0/Mp
	4mxoHHAMFxEEnlJ3Yf4bUqGxo71yV7CbNR2363Y1/mO6e8vgp9wlfqaf2gvgphLRogmWGEjA/uMxs
	u3YY2xmv4d5oDw3sYYNG7E48wdVYrdMqTiKZr1H58j8gCpm3RyZQV7M1OfA7jKpLqs1NzQueTm5Ra
	ylxX0ohuGbz+wN9IPAsuBGRG7RmY6VpzAIBkNGGS56TSURg4DZVm3qJnFQFOoMrryh/6MW2WYVyeD
	DJU8JnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncAzE-007ff8-LE; Wed, 06 Apr 2022 19:06:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncAzC-007fec-BB
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 19:06:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t13so2973771pgn.8
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xEHjPFbG2l95vT/9TUf5xFEmrU+wbLDsR7mssjGd3t0=;
 b=0eKouJ7hzOepoVSRqRsRB5ISeXx5Nnlsh14Z1+53rddDy3I8jc5eKeLb6eDXtzkKGc
 L525OQvHPL8S530OfqYvY+irHpGV2xABBSf+IDUZy2TIx9o0HOVcskxU+vys6yD+o+Uk
 Lney/6JQGjjx8pDVxo6Qj7fyU0sRt2PlviBAiMEBMttx/TSlRs4qvlYSqS2wx7NT5UNX
 6cmLXSroLEDYa5BKLtbFZugvXcSdfLritrR1NnsKzh2QJzb4zlZHUAOjbdDGEm9522jw
 5U7yEwauEC4gC1bJpv/7tuwrw/e/YsognCW0wblaH9nEZnSZUbabNx9XD62+MGGfEK65
 IZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xEHjPFbG2l95vT/9TUf5xFEmrU+wbLDsR7mssjGd3t0=;
 b=l/Q/SFbZhct8IDyjT/+4zdB2pP3IxR4RQL6mqqiXE1F/bBtmXHHMz6lz7t1rZ5eSYc
 jp7IXIPaEyYBEQbZ+UVRuNWNmdWSI3sen7zgDnGvcMJNX1N9/ScGaLGp8UjPUohFWGji
 MRXrOYaMSFZqgTZLF5TAZFSbr9MW2LB5WOyWQubtKnLP3hRyD9t9snLNdMAAOf+1146e
 sh6JJSsIfBokeVM8AomLusyxXgJbJvRNv3jOKGSRFeA9IkswhUmscv/vUgUNDG0qzlM6
 hJBcsrT7yEHy7vFkoNuvH5TqGuSH1MKI/UnSF+ohLIb66Qz8CK3qekKoS8DM9eoFR6AS
 sj1A==
X-Gm-Message-State: AOAM533X88pN+or33gqXhXUG662jnPfRtSb3ltiqNVTTG22dKuy01K8K
 FS0XFgHhPeywu1aKmQDHf8GBDw==
X-Google-Smtp-Source: ABdhPJzzIPquNU49pHdFoqAJuy/FaFv3mvXL+ipftmawmoH39R144bhpC5RIr4bImN+8/rAtsHhEjA==
X-Received: by 2002:a05:6a00:190a:b0:4fa:e4e9:7126 with SMTP id
 y10-20020a056a00190a00b004fae4e97126mr10336457pfi.65.1649271991420; 
 Wed, 06 Apr 2022 12:06:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 z16-20020aa78890000000b004fad8469f88sm20788500pfe.38.2022.04.06.12.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 12:06:31 -0700 (PDT)
Date: Wed, 06 Apr 2022 12:06:31 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Apr 2022 12:06:29 PDT (-0700)
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
In-Reply-To: <Yk3YUFfvEszb+cXT@kroah.com>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@linux.alibaba.com, mhiramat@kernel.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-492e449b-ad90-4725-86a0-d5d84e4c35be@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_120634_637215_C7F6FA85 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, 06 Apr 2022 11:13:36 PDT (-0700), Greg KH wrote:
> On Wed, Apr 06, 2022 at 10:16:49PM +0800, guoren@kernel.org wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> These patch_text implementations are using stop_machine_cpuslocked
>> infrastructure with atomic cpu_count. The original idea: When the
>> master CPU patch_text, the others should wait for it. But current
>> implementation is using the first CPU as master, which couldn't
>> guarantee the remaining CPUs are waiting. This patch changes the
>> last CPU as the master to solve the potential risk.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
>> Cc: <stable@vger.kernel.org>
>> ---
>>  arch/riscv/kernel/patch.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> What commit id does this change fix?

I think it's been there since the beginning of our text patching, so

Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")

seems like the best bet, but I'll go take another look before merging 
it.  That's confusing here, as I acked it, but that was for an earlier 
version that touched more than one arch so it was more ambiguous as to 
which tree it was going through (IIRC I said one of those "LMK if you 
want it through my tree, but here's an Ack in case someone else wants to 
take it" sort of things, as I usually do when it's ambiguous).

Without a changelog, cover letter, or the other patches in the set it's 
kind of hard to tell, though ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
