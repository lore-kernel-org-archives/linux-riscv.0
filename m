Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F6BC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FASPT2dUr91pxm6VQ49eKrhIJJUmwzp7iFdXJjnu56w=; b=pI6DekT6u3579W
	/QNAFsYMzO5EcBXWJ8vzS0pHA7YbJEXWWO2OW2RxcAaxyFjQe89RVowT5Qsd3gGlRpGII3KrLkQIl
	guPFfwHJpzDzhGomzAqTTbowxmP6FSD6/h+IbXreWs4fXBaw8v7bJ5K80yFJ9a2cAc88oxJNJyJjQ
	IGutATBs6OrkgsP7I3pYX25E7pD0x9Y9jDf4Cnr4g3aptsXoE/lRNbojFzWCKLzoGQIvrxad77sdS
	Q5Srdg4M0aUEVo7K09PgY5Y/eMf+tJpAyRAUgPWWBjzzZ8pBlYE39kOjV1ZnlSbqwqx7eKh4Km1JQ
	PX2bam8YHMRpkkfJypzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnvO-009I5n-Si; Sat, 11 Feb 2023 11:20:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnvL-009I5N-PI
	for linux-riscv@lists.infradead.org; Sat, 11 Feb 2023 11:20:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF044B80189;
	Sat, 11 Feb 2023 11:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3B1C433D2;
	Sat, 11 Feb 2023 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676114404;
	bh=Ov3TgSe1z7ULdRmETzZ6wrDRCVYC0cGHuEwgv62umhs=;
	h=Date:To:Cc:From:Subject:From;
	b=j5nAqTFYTONllnUp7829ZJFWGSLrfo/H8nfZv2UvgQQ5xyiAhIOD6dhik5rO/ys7G
	 OQClBrmp/HPcN15rN6fpEzLUXznFdzbHkMc/gwVuRujqE0LfpLcFxVSKqq1c9Evj12
	 k3MMsEuZb4/WVHEL7jkFZvN0FBVTVk5fjyfQ31GS2CPx0E3mLfjZpAktI8PFVZOd0R
	 UPQSkyTHytd7YkjvFwUU+YzW9ebU3Byc/b+NfcFbRTDzt7aj7CRmsHrV4RZp+PhTiV
	 EnSP+GWThHlCk8qPZsJL7VFnTIx3MnFStoFSbi/IY3ywaiFYu+2xENI3NsAfNpHRid
	 3m27cgWVE64aQ==
Message-ID: <785425ca-4000-a7e4-16d6-4d68c91b158d@kernel.org>
Date: Sat, 11 Feb 2023 11:20:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: sagar.kadam@openfive.com
Cc: Sagar Kadam <sagar.kadam@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Conor Dooley <conor@kernel.org>
Subject: sagar.kadam@sifive is bouncing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_032008_019275_8ECCA19B 
X-CRM114-Status: UNSURE (   5.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Sagar,
You're listed in the kernel as a maintainer for some dt-bindings
but your sifive email bounces.
The bounce suggests you may now use an openfive address:
"You may want to try emailing them using the same address, except
use @openfive.com at the end instead of @sifive.com."

If this address is active, do you still wish to be listed as a
maintainer for these bindings?

rg "sagar.kadam"
Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
11:  - Sagar Kadam <sagar.kadam@sifive.com>

Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
48:  - Sagar Kadam <sagar.kadam@sifive.com>

Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
11:  - Sagar Kadam <sagar.kadam@sifive.com>

Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
11:  - Sagar Kadam <sagar.kadam@sifive.com>

Cheers,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
