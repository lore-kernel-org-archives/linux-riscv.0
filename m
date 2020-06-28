Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456C6C433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 19:56:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110A92053B
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 19:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="26LBgPXr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVh4v78r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110A92053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlJP/UK0ttz5qkpJJUsveuNbwZkuVKVQDa5Om/m41zk=; b=26LBgPXrkCiVQ08PM8M9mJ52YA
	PWla8zoyb3TbwPWDgFaapcH13+gExuVGrToJx9W/TIsTaH9M7Nu+ouihyO1zMAPMMwe0g+Q3/toOS
	OFJiPT5j8pAbACmXAWeCereV0FZFkMCq6TOm5n096iPIzxPCTNNsoADtNROpeRHdtqw7JEBgi/EEB
	OPQsE6tS8WkEqAaZD0koxkWgAYgQqs8NOV+rhZA9PGei7NVlOSNoIAjvIYbhgN70ONLRqXzOxPv1R
	OPsNjDJ/biq4R1mvsogU5xfAcXp0tf/PeqhmgMyL10irqps7v/UNowhLGlNSPy3UXE/3YLDoynk4N
	cKhiv7Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpdPW-0004No-58; Sun, 28 Jun 2020 19:56:18 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpdPU-0004NY-Hl
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 19:56:17 +0000
Received: by mail-qt1-x844.google.com with SMTP id e12so11361492qtr.9
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MKmINPh1FRPrjfrGQ5s9Iv1ni2wlT0v48XVHAcMsEa8=;
 b=dVh4v78rLubVgVI7gMbglkN2N/NxpUCRK1ys8ZdyRbhXSurR8c7JiWz7zjniGKGsCM
 vKNU3bJa9YGXW6cIF/AXfNNjaf1J2qXTQIJbNsCCcwGvL5WfFEshdVMCaw5j6Xf9Jnk7
 baztjNBTlWKJ/mN73FnOciTiTt6NMLyNNB5CN748KK/NTIgM4TOrKqMNkOv7UxMPF9qG
 dqImm2pQ32Hub7rbKUbtZxD6uRjEd9Oy3Bka0vICj3YcRqOC2+qCKdsjn1wAmu3jlZ3S
 oO80imc59/mtiF9W8+C1Ne9vdKHQqKDwmtVGpni9KUzW9VIZqjfPxezyyG/iKH8FDJvr
 UbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MKmINPh1FRPrjfrGQ5s9Iv1ni2wlT0v48XVHAcMsEa8=;
 b=ckkV4M9MYGWuimanI//AzOjPqpwKmp7noHu65R0e/W1OAB9z3quPuV0rJqnZ1xG/d5
 rHZJNkHMSYcOZUqMCGG7ECygLA/ZA4i74MKNRqabDRR7iAhbvi1J4XGZx3Rr56PDikKw
 vMx6AlOa8IKbQM6negMldAlxMBkMdVMfp2OI6LduC9Kb+OMeG7Ee+cjnEFGcbLR3V6Vh
 9ENMUjOzauwkgrwSoszngwEy+f8eZtOzPfPsbKOmZ/TKskI5xvl3JT+wglPmqHFumRfU
 +bYHGLX2PovfeXF979Dcnclla0BKdZhiy01fR5RtENZvrI9NQc4MoUhpENw4gXdiXUan
 7scQ==
X-Gm-Message-State: AOAM530UHKTrdh+w5kubTXRQEMlj+7r3Tq8QWri7+2LL3Hr4hs9GBq/5
 7vbeIs8Nn4y/C/1sSlbVWN4=
X-Google-Smtp-Source: ABdhPJwjCStMKzmw+qb3Z5ldiFv9ycqvOYxrLxa+Kq1VazcDQVkvAYlRo7cVJdPzBSO1jHzmUMmKPg==
X-Received: by 2002:ac8:110a:: with SMTP id c10mr13018111qtj.163.1593374174048; 
 Sun, 28 Jun 2020 12:56:14 -0700 (PDT)
Received: from [192.168.1.209] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162]) by smtp.googlemail.com with ESMTPSA id
 w185sm11197127qkb.112.2020.06.28.12.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jun 2020 12:56:13 -0700 (PDT)
Subject: Re: Kendryte K210: state of MMU support?
To: Drew Fustini <pdp7pdp7@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Carlos Eduardo de Paula <me@carlosedp.com>
References: <CAEf4M_BK29oDh94-j3+nixqfPi_r=13Svs4xOUCh_oYjPUg+pg@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeMuQENBF0/k2UBCADhvSlHblNc/aRAWtCFDblCJJMN/8Sd7S9u4ZRS
 w1wIB4tTF7caxc8yfCHa+FjMFeVu34QPtMOvd/gfHz0mr+t0PiTAdDSbd6o7tj+g5ylm+FhT
 OTUtJQ6mx6L9GzMmIDEbLxJMB9RfJaL2mT5JkujKxEst6nlHGV/lEQ54xBl5ImrPvuR5Dbnr
 zWQYlafb1IC5ZFwSMpBeSfhS7/kGPtFY3NkpLrii/CF+ME0DYYWxlkDIycqF3fsUGGfb3HIq
 z2l95OB45+mCs9DrIDZXRT6mFjLcl35UzuEErNIskCl9NKlbvAMAl+gbDH275SnE44ocC4qu
 0tMe7Z5jpOy6J8nNABEBAAGJATwEGAEKACYWIQSQYR1bzo1I0gPoYCg+6I/stKEQbgUCXT+T
 ZQIbDAUJAeEzgAAKCRA+6I/stKEQbjAGB/4mYRqZTTEFmcS+f+8zsmjt2CfWvm38kR+sJFWB
 vz82pFiUWbUM5xvcuOQhz698WQnIazbDGSYaOipyVNS52YiuYJDqMszzgw++DrcSuu0oRYWN
 EWCkJjxMqjGg8uY0OZ6FJG+gYRN5wMFErGfV1OqQ7l00FYA9OzpOEuW9PzPZEutFnAbbh77i
 zvxbQtT7IJCL24A4KutNYKmWg98im4mCzQcJCxE86Bv69ErLVPUyYbp4doLadScilXlvkkjL
 iq1wOt3rRzOuw+qnWVgWGBPxdDftz0Wck941tYF9XE0aMgkf4o1sGoDZFUFPCQdfEYPzzV7O
 S5hN3/mP5UeooFHb
Message-ID: <25d7abde-b3a5-4488-ea93-e0aca9e0693f@gmail.com>
Date: Sun, 28 Jun 2020 15:56:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAEf4M_BK29oDh94-j3+nixqfPi_r=13Svs4xOUCh_oYjPUg+pg@mail.gmail.com>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/28/20 11:54 AM, Drew Fustini wrote:
> Hello - as far as I know, the MMU in the K210 is still not supported by Linux.
> 
> Anyone know of progress that has been made?
> 
> Thanks,
> Drew
> 

AFAIK support for the MMU is not planned, since it follows an older
version of the privilege-mode specs. For discussion, see [1], [2].

The CSRs to configure the MMU on the K210 can only be accessed via
M-mode, so the existing boot-chain with OpenSBI before Linux would not
work. In addition, as discussed in [1], there are some ties between
M-mode Linux and NOMMU on riscv. Aside from that, the only other major
differences are in the layout of some CSRs.

--Sean

[1] https://lore.kernel.org/linux-riscv/mhng-a9c74759-ab94-4270-a993-9df380811220@palmerdabbelt-glaptop1/T/#m56d9c49c53b104e282106005bf6d289cad4970a3
[2] https://lore.kernel.org/linux-riscv/20200312051107.1454880-1-damien.lemoal@wdc.com/T/#m137c2c073481f21207c92633550e6465ffc1c550


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
