Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AD4ECDE4C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E5320843
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 09:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IGbTqB4T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="y5SSihpk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E5320843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMiGFAhI9g0fnQ2jOF+8Kis0LK1yKUCpoKClm06Sv5o=; b=IGbTqB4TkC/udX
	3fXP9dPE55PHtTdX0lFAHwE/Elgu4vrk9/uMSLWbzVaWp3y097G0QZAhK7/ZJuKxJaS4bEnaR7wHa
	EKyqLpoU71Oh2b1+pRbDTb7qRDSqm8ANwexsaMi+CfKvwJGwIIov2Dt7fOM734v2B86bEHZFBtoqV
	4RZbodjzgIWo1Vxzz8X3qE8qn3PAQV7b11DEKQ/7cXTzKWDVVv2BJTcXkSWwytzwVkNHsbxdXvfEh
	bNm6DAFWlARXYH1UugUoR6xcSUXOSYl9SRQXzwZ08WRbV4e+czwmEfqPu/JlAJcMRDUfVVs42Yvps
	bLiuJvaknF9xVCLQk7WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gI9Oj-0007Yp-6I; Thu, 01 Nov 2018 09:36:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI9Og-0007Wl-KM
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 09:36:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id y15-v6so19391686wru.9
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 02:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UMj82xJ8It2jcF/3t2vZ3Db9gglmkEjCuqoUvZDCBCI=;
 b=y5SSihpkLBZ1h5ttPgtKMDnrXsdEWPLD5inmFDe2PGpJIEaOUzU3Jg1fOJZcTJ2lN5
 14sn3yVyveXYvPsPIqPRfe1IYAcdDZuPwEWzoEHohsbB2Zj9+fjDE9/IIKhYWl4XuYpx
 pX0XnzEAnnyrWE5c4ZCkCxHFq7Sii2l4z/emJ2wTLcEomEmHPtO4kSPzZWAatjye3eXw
 Sy8SEei2jyguM52aLzzdoYz1hlihkGQxq6PB0EXiQSnyO1mryPYtI7HMQVCW4YkEgYB9
 ITHNhPd4ls9NGvF+Zw6b+uAJxaGxIVJt95N2BgvzPO5XkwOuXh9xqWm9DSmJlc/vg5+4
 Pp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMj82xJ8It2jcF/3t2vZ3Db9gglmkEjCuqoUvZDCBCI=;
 b=tBKjuvFgo4PNyJXTiYU8oRlB0At74nbhrKZo4BJGa60hHGh6mszR3LaPLSEZCM8rnr
 Z6BWbiPTKlgCWqQkzRgeW/ls1owU4Ul6EC9b/imP6h/NlGyqUud0N0xTacYmwRyOadpw
 xuj7v+7qlfBux/xOSJHgPF2PZYuqknXpcyDTb1NVb+3BCiMzE6NEebEmjwkIOc6eFwOu
 hSQJGMakOn+a78z7FEbe2J1PtoRDXlL+ZXojA+gYLvAN7TWJ72UmhRHTHMbn9x8jrqQM
 QIrV3UzEAOS7we5MLPcmklCJ0NxsV0hMhCl4vMMvUDBMtoEWNZgjjUqYhn4tGueXUyEz
 7Yug==
X-Gm-Message-State: AGRZ1gJAAMjec3hCSUgDJllNlyn1JHkVtXjBx4JRrUmyXXTsZKJqZS/s
 DJqgQzxj26JJWCxuKVNKKjLMBo1C9VmcSXwzak/C7Q==
X-Google-Smtp-Source: AJdET5fmOqFZnqZpsb9BU7dB2mrl3OMDg7SkErZtW6/EHFNDsVTiO2AUP33dDM7ecL0KNAN1fL3ju0M2CyvUBAGR5hc=
X-Received: by 2002:adf:8444:: with SMTP id
 62-v6mr5547872wrf.251.1541064962626; 
 Thu, 01 Nov 2018 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
In-Reply-To: <CA+h06zgcyWz7WMbzQxjyc9V5S3CokqSoO1mGOaynJE3uJE5QSg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 Nov 2018 15:05:51 +0530
Message-ID:
 <CAAhSdy3mC2-tLNF5jmsHEFrKR7pG6afbM-aYu-6q2LkB7mRG7A@mail.gmail.com>
Subject: Re: SBI extension proposal
To: philipp@hug.cx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_023614_734442_2BF12CFA 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, olof.johansson@gmail.com,
 Andrew Waterman <andrew@sifive.com>, alankao@andestech.com,
 Palmer Dabbelt <palmer@sifive.com>, rjones@redhat.com,
 Zong Li <zong@andestech.com>, Atish Patra <atish.patra@wdc.com>,
 Michael Clark <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, abner.chang@hpe.com,
 vincentc@andestech.com, David.Abdurachmanov@cern.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101093551.6GxeEjeCmkJlAj9yIEz_-LwD2ZQlSQvXZjfDDRb-Tv0@z>

On Thu, Nov 1, 2018 at 2:50 PM Philipp Hug <philipp@hug.cx> wrote:
>
> Hi Atish,
>
> Am Mi., 31. Okt. 2018 um 19:24 Uhr schrieb Atish Patra <atish.patra@wdc.com>:
>>
>> -- u32 sbi_get_version(void):
>> -- u32 sbi_check_api(unsigned long start_api_id, unsigned long count):
>
>
> How about putting the version information into device tree and use the compatible string? This seems more reliable than probing.
> e.g.
> firmware {
>         sbi {
>                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
>         };
> };

If it was just DT then I think having this information in DT makes
sense. In future,
we might definitely see some ACPI support in RISC-V too (just like ARM64 world).

Of course, we cannot keep adding new SBI calls for static information but we can
certainly have bare-minimum mandatory SBI calls for version and capabilities.

>
> You could also add more information about the supported features to this sbi node.
>
> I'd also suggest that all functions can return an error code and are not of type void.

Yes, I agree. With SBI v0.2, existing SBI calls from v0.1 should
return error code.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
