Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DB8C98311
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	Mime-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsHYxkpfQwYCkP7erIu50IzlOCvKNf7bBkHP1fwSLSw=; b=tYkDCKULVf3VTo
	l1uSTKefVTqL/0RNVjHTS8MC1cjsxF5qUmpawqQ0fs7/PFk6x7yBQujMj2H0yPwit7u4cSBjguLBk
	ZCnQqbSGEBs/989uxrQKWCOXciamPjUONlGtwT6CZvCPTE4cM5rYmG6ReczYHq12hEuXm197+qtkA
	NQ8R9xhFd8QwEV1Hynsnk9LX1upZ5f3K5ZOSM+hvnxJzK3EJl5cTtL2HWedbLh3sH3Pb2MEPrUesR
	GqqLbfEiKe6evpwcETYt6BTdwpw9tOYAKDxGG8V0ImoG0795C1Tqoaiu/XNF0gYPC4Ah9DyVD710j
	3STDUUjFPelSZLJz3FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g7D-0000000AdbF-1ed5;
	Thu, 24 Sep 2026 09:51:43 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g7A-0000000AdaK-01Ek
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 09:51:41 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so16530301fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 02:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243494; cv=none;
        d=google.com; s=arc-20260327;
        b=AC0v0lOocrWkDipVzkEz9ofexd4MsfTBaADq8lX5u3OchZbwwePXW8z/iYZT4rbsxO
         pVxwkBd+fYCuWv010WWFeYi6DzQQ6FFk9x1+wjtCWK36QSXbd86pS+XwVP1oafl+egZg
         t7sK++CN4pKt3vAR+xHsUkiHuHYDvDAwT6pE8nrOUHz5owWL+vSMizawn2TcBzx1izlO
         yF6HolNvCAFfhJteGaJZsOfvuSDi/VIaIbvmi0pnWmZSOhnbudopxum+/spuJxAhCE3g
         XlNg24a4x1poKkvVMWiNRuGZ3Neakr8lVguLmdh9bi3cLgF4muXs9ySOrlGk1Mtw0FFN
         Md3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:user-agent:mime-version
         :references:in-reply-to:dkim-signature;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        fh=tPq1Y/3P24Cxaz74L1jFMyaaIB5oW5WOyRzWr/Ukx9s=;
        b=S4Bs/bNajk1B4YGbZ5wOn0isD0NaeekbLKfiE1ikSZHDmUM5GwzPZ73ZKbPCbnNT4P
         ckYuINSsR5DM7WDXtFlWbunfEyZL9HQNn+szqfs+H7j13u5UMpXP51FlrFOMeDXcpWvM
         syUonT5j2UxafU2MjlGZZtHiq+ax0WiA80nepYovmjLySZl360xzcbEkL0cWANnVhu8Z
         p0I8tC6XkgCTDjHCfiZPCP+G9aWOYS2iu/z8a+WVAMDEJLcQJXdXuiR16WdLlj/9m4Ct
         NtsCgn+jSP5IqctQ3+20n4lupzx93Vn3Y8+QR5cSpVzxRwhM8DUtKtuJCxyh63EFyZBu
         1gZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790243494; x=1790848294; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:user-agent
         :mime-version:references:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        b=T6Oc3zLlWS53tf9QbefeCSjSJNmyA3i2ki0bOKc222JqWf5Ah3KwL2PxnJ4xykYr0v
         Cy5rqa+eEoj2mkcXQIJK/hSc6HhI1bdKI3CKnz6c5ziZ+2kIvGtmMI2YuRK68Y36uzIC
         ECE3PbjWyqhDeoqcjP/AevMRV9hsFoMmkhYZMpSwbemWAA4QPCDILciHOTWUSwNNursp
         ZhiQf8L44cS5k98tNOPtNl7mrqzDaLW+3Ihxd8bevPYq5mfNl3k7JDw4Qp2iXuy8fjhB
         zNh+lFmczgA8OYHD3ZUvL4EIZbjyxzzMU+TGG6CGKwdOPOTDqAR/ANImAGLT0YWHAU6Z
         xNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243494; x=1790848294;
        h=content-type:cc:to:subject:message-id:date:from:user-agent
         :mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        b=PEi9RI+idv/XSkMY4hOZpcWNdJYqNEm/KJn5OerKUtg00pqsPB0qtckIyEwFCd83+L
         t71e4+bc7/5WiXDHKGVAxPTk1zTGKaf43gDEmxtDlqqdj/NEtAXQqMrQQKAdGAgvLAZW
         Ai1gJqw07RwqabzWC/0Kpm3qMZZFdum2D07VANumvB2t6FlC6jMTfezLsOmHctXtHXi/
         uOntLXq1Mqe5NuSFsFfQwTBYCukTzXDQdgTMnflQpY7RCiJbhWHwQx5wNfecs1NlvOWr
         nEzSTTJT0XNCywDhVl1PdEHfohbTddpMelT8xNlm6S3B+ze4D2I2mOxi9s/ZqJbGn6eF
         szVA==
X-Forwarded-Encrypted: i=1; AKwUvBznzYieyZqqszEOUYR+klz81x+bPVP2RXqiSAwdsGeIUTpu0RVz3SimZIJwO6GIU5QD3hxkvqfTZv+H+g==@lists.infradead.org
X-Gm-Message-State: AFuF++kg3zgi5hOLlfYU8hUjhd42bpMg48eNoBIo4z2niCesnt2mB7e2
	s/bQIJ6VN3yQmO5VSovywZ9aSLyTzciaaIeLwnVFE5NE1u8UJN8BwJsd38wtlXZW0NsbG82OBKS
	xzXZgJymjyWdBb4gSq5DiG9d8k1TqT8cZlnldOtMOBQ==
X-Gm-Gg: AYBFou28/Trs5Lhcuuf0nzz7oXc5U6QeKbLrpSAXh4AMR3yjrjNBbXdSYOA+fDE9sc6
	W39hTjB8+H4QopRuoZ5Wc12hg/LG5hwovwTETV8LM+3/RcorhcsZNj6Zz/tttX6qrOq4UlDl7fz
	hFUyWd4aFQahf6l9CH9hZioaCQjelxb1fKgBnedsGRcCk+2dWHt+kkU+SaqMBTpkpGSaTFttMux
	XoCd5Pi69hdw8kyQT9WkmyDiHlZNxVqV5o+939VxTlqWl7WPvhDk77LI+p4Ye8a4B0mAwlrjux/
	SEAjgKtxc60FgeYl40EtDdg4q2qcxFyCGIikmnp0r038cAW1N6Y/a+A=
X-Received: by 2002:a05:651c:b1e:b0:3a5:f041:d7c9 with SMTP id
 38308e7fff4ca-3a63c2fbe45mr4361511fa.22.1790243494487; Thu, 24 Sep 2026
 02:51:34 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 02:51:33 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 02:51:33 -0700
In-Reply-To: <arKx__kOPe4B5gDW@agluck-desk3>
References: <arKx__kOPe4B5gDW@agluck-desk3>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Thu, 24 Sep 2026 02:51:33 -0700
X-Gm-Features: AclHuK8hLnUXrqZJavVwd1RFJSGYNAQLudfmbLvNFp-j_eu9SV3bDABt6ZKV-Fg
Message-ID: <CACnXVne=bK9sESdsFS6kbtYJuirqFoqTckuSjJuk0NYyByLM7Q@mail.gmail.com>
Subject: Re: Resctrl and I/O
To: "Luck, Tony" <tony.luck@intel.com>, alex@ghiti.fr, fustini@kernel.org, 
	aou@eecs.berkeley.edu, babu.moger@amd.com, baolin.wang@linux.alibaba.com, 
	ben.horgan@arm.com, corbet@lwn.net, cuiyunhui@bytedance.com, 
	Dave.Martin@arm.com, james.morse@arm.com, jgg@ziepe.ca, joro@8bytes.org, 
	kevin.tian@intel.com, palmer@dabbelt.com, pjw@kernel.org, 
	reinette.chatre@intel.com, robin.murphy@arm.com, shuah@kernel.org, 
	tomasz.jeznach@linux.dev, wangzhou1@hisilicon.com, will@kernel.org, 
	xiaqinxin@huawei.com, yuanzhu@bytedance.com, zengheng4@huawei.com
Cc: x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_025140_227523_134F9279 
X-CRM114-Status: GOOD (  24.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

On 9/23/26 12:51 AM, Luck, Tony wrote:
> Patches for ARM[1] and RISC-V[2] are both at RFC status.
>
> They appear to be based on similar h/w capabilities where architecture
> specific tags can be added to transactions from I/O devices by the IOMMU
> servicing the device. Device enumeration is handled outside of the resctrl
> file system.
>
> ARM docs say "the device name is the one listed under /sys/kernel/iommu_groups/<id>/devices/"
>
> RISC-V says architecture specific device tokens are "devices or device groups"
>
> In both cases assignments are made with:
>
> 	# echo {device} > {group}/devices
>
> So now I'm looking at the capabilities of Intel RDT hardware. I'm ignoring
> the implementation on the Granite Rapids CPU, and looking at what is described
> in the RDT Architecture Specification[3]. Here are the highlights:
>
> 1) Enumeration is split between two ACPI tables. IRDT enumerates device groups
> and provides MMIO addresses to assign CLOSID/RMID to each group. ERDT provides
> MMIO addresses to read event counts for RMIDs and to configure cache allocation
> bit masks and memory bandwidth limits.
>
> 2) All I/O monitoring and control is with respect to I/O caches, not to the L3
> caches that legacy RDT features operate on.
>
> 3) The number of RMIDs supported for I/O is lower (maybe considearbly lower)
> than the number supported for CPU monitoring.
>
> 4) Monitoring events are I/O cache occupancy, total i/o bandwidth, and i/o miss
> bandwidth.
>
> 5) Current revision (1.4) of the specification doesn't include details of
> I/O memory bandwidth control (The "IBAD" subtable of ERDT is reserved for this).
>
>
> Fitting this into resctrl
> -------------------------
>
> RISC-V description of "architecture specific device tokens" sounds great.
> I'll have to find some ares of /sys to provide the mapping of tokens to
> "device groups". There's no association with IOMMUs, so this will be some
> other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
> from ACPI IRDT table.
>
> Need an info file to tell users the format and source for device tokens.
>
> I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
> number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
> events} files in resctrl group directories when rdtgroup::mon::rmid >=
> num_io_rmids? But that feels clumsy.
>
> Domains are based on I/O L3 cache instances. So a new rdt_resource with
> new line in the schemata file for IOL3 cache masks per domain. In the
> future when there are I/O MBA controls, new line(s) for those too.

Thanks for the feedback and the detailed discussion.

I have been occupied with some other work recently and have not had
enough time to follow all the replies closely. I will catch up on the
discussion and take the feedback into account before posting the next
version of the RISC-V patchset.

Thanks again for all the comments and suggestions.

>
> -Tony
>
>
> [1] https://lore.kernel.org/linux-iommu/20260901140802.1215508-1-xiaqinxin@huawei.com/
> [2] https://lore.kernel.org/lkml/20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com/
> [3] Linked from the bottom of https://www.intel.com/sdm under "Related Specifications", or
> direct link: https://cdrdv2.intel.com/v1/dl/getContent/789566?erpm_id=1158389_ts1790091453223


Best regards,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
