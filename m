Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D5C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZQeekSxyFKCRW7bdQHjMHG3DteWFW9NybCA6fO/K2Yc=; b=R1/o78aIpVZMa/
	sOiGPUIkepado/MvZLEe2LO5jGS9//vw3KqnpcBv5cWgK8Wq+Q8nG7bp9W86YwDX1WtKcY92tKHgu
	fK7+vTluL8GkopIYdJZg40yaJFJ1jeSVkykeXgI83aUWuv2j3Y1jJ38mbwwDOi2C5hVLK41yGd9kJ
	kGX+zBuWXQNBbGGJ6ftjU56bUl5mL2QRdqROJfI60c70nFKq6L6aB/Rai4AgowKx25WK8uYwPKB/6
	faEracboOOyP6uh+BDbGNk8K1ACRpY0NJzyXNGUv19bgRkKSzCAeJGqYva3+Xmux42+AHUCsvGoTZ
	bTMZdT4BjpoL4tooLkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcF3e-00BrUs-2d;
	Wed, 15 Mar 2023 00:31:58 +0000
Received: from [103.30.145.160] (helo=defaultworkshop.klidefectmanagement.com.novalocal)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcF3b-00BrUD-0I
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 00:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=asda.co.uk;
	s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=q78cjK9V18wO72c7vs4LdhQlmLO/5GuM6pHshjgw/Bg=; b=C
	+SdyVsCCd4zvezK4EO0XTF66iFEaBLwdsK2zGPQHZl3kKNVv5W4QTU1U0q+MZu+bdvflkmUVreTdk
	ldI5UA1OG1oBs5N5/TaEmiqgE0XYKz7wn8S7PlFigrN0YYnH9PzJtzpUr2Rp0kNg/VFGslUKWs37d
	LyRzEz0PUcG+HTmA=;
Received: from ec2-52-11-215-80.us-west-2.compute.amazonaws.com ([52.11.215.80] helo=asda.co.uk)
	by defaultworkshop.klidefectmanagement.com.novalocal with esmtpa (Exim 4.94.2)
	(envelope-from <sales1@asda.co.uk>)
	id 1pblz2-00066e-Io
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 00:29:17 +0700
From: ASDA Stores Limited <sales1@asda.co.uk>
To: linux-riscv@lists.infradead.org
Subject: First quarter procurement order/enquiry
Date: 13 Mar 2023 17:29:15 +0000
Message-ID: <20230313152049.DE0D26EF80F265FB@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_173155_134113_2CAD83F5 
X-CRM114-Status: UNSURE (  -0.86  )
X-CRM114-Notice: Please train this message.
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
Reply-To: sales@asda-c.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dear linux-riscv
I'm a procurement manager  with ASDA Group (the owners of ASDA 
Stores) and your company product has caught our interest. 
Therefore, we request you send
list and prices of your hot selling items (products) for our 
evaluation/pick.

Soon as we receive your reply, we shall send you our company 
profile and buying proposal. You can also check our website below 
for detailed info of our purchase area and trading capacity.

Your immediate response E-mail:  sales@asda-c.com   shall be 
appreciated.

Best Wishes

Ms Stelle Montgomery
Purchasing Dept.
ASDA Stores Limited
Tel:  +44 7418367220
WhatsApp: + 44-7502985874
Website: www.asda.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
