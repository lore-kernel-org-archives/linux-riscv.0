Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D741D0E6EC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUvWFetXdjvaoOj9HX0YmHJqkH5c7MwnnjaDF95vfCU=; b=d7wFa78CsKIKTT
	QOa5GtJyAjxCc5kDUc0hulwZkhl1XnfWn3iX/4vwUC5dKtfWjH7oEssGXzlgt9R2uT8uQyVsLPcX1
	PiHqEPP5g7agdTjvnbmqQ0px8iPCnUXvRquxe55sEVvlk8aHsUY9M7sbyrvgtHvlkYxw34D3ZkVVY
	OQk2pLMks2T+eT6mdV02M+FLaEDwFqyqBFnk7b2a5cpaDZ63fZxv5Oy82yZRqXnzGqsSkZWmr2lIS
	5T/+wTAu92jSwiruc3WIawpvXANFYOwg4SNLosVxZ0rvE+JHEZq5L7liSxg5IfoN5+lfoJT0sFgKm
	I3/hjE7EItMnYLMkftlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtZS-0000000DOFo-3Qpr;
	Tue, 25 Nov 2025 13:59:06 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtZP-0000000DOEp-1jhf
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 13:59:05 +0000
Received: from [127.0.0.1] (unknown [120.227.56.192])
	by APP-05 (Coremail) with SMTP id zQCowADX0WIgtiVp7jMDAg--.34419S2;
	Tue, 25 Nov 2025 21:58:56 +0800 (CST)
Message-ID: <86e7ddce-2906-4b2f-9b35-f74555e9c473@isrc.iscas.ac.cn>
Date: Tue, 25 Nov 2025 21:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add Zilsd/Zclsd support in hwprobe and KVM
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
 <ca507aa5-670e-405a-a1dc-3316f96cef3b@isrc.iscas.ac.cn>
 <4d7863cd-34c4-281f-48e8-f128bcefaee5@kernel.org>
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <4d7863cd-34c4-281f-48e8-f128bcefaee5@kernel.org>
X-CM-TRANSID: zQCowADX0WIgtiVp7jMDAg--.34419S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJF1UZF13AF1kKFyrCrg_yoWDKFX_Wr
	Wj9F97Kw48JFy8JanxKr40krZIg3W8Cw1Uta48J34xtr1rZFn8uF4Ikr97Ww18tFyfAFW3
	GrZI9a1Sqr4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbr8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVWUJVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-Originating-IP: [120.227.56.192]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055903_818864_0894B622 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Paul,

On 2025/11/25 17:52, Paul Walmsley wrote:
> On Fri, 21 Nov 2025, Pincheng Wang wrote:
> 
>> I noticed that this patch has remained in the testing branch for some time,
>> while the other patches in the same batch have already moved into the
>> experimental/merged and for-next branch.
>>
>> When testing locally by merging the current testing branch onto the latest
>> for-next, I observed merge conflicts in the related areas. I would be glad to
>> rebase the patch onto the current tree and send a new version if that would
>> help resolve the conflicts.
>>
>> Please let me know whether you would prefer me to prepare a rebased v3, or if
>> the merge will be handled on your side.
>>
>> Happy to rebase and resend if that would help.
> 
> These are now queued for v6.19.
> 
> I had to clean up a few checkpatch and whitespace issues; please keep that
> in mind for future patches.

Thank you for the update.

I appreciate you taking the time to clean up the checkpatch and 
whitespace issues. I will make sure to pay closer attention to these 
detains in future patches.

Best regards,
Pincheng Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
