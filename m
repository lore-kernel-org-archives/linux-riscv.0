Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCED7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B792083D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OvGRFdoo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dfKIE2Nf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99B792083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y9a8WAcK4njkBFW2uJ3ABCe6MI0S2k3jLRpoYQ/cCU=; b=OvGRFdoo/XfMx+
	Qvfx958VJjI0oUudethBN+ugeYvuaKTkZfvYWPOKXTABUPiEMMe3+0Axh70fqdV5WBbjfppl4xyNe
	E86XMQXznb9x7tPSD4Zxt6gqoVlb3m10tIwmFfzqe0v2t4H/VoZsTpofnXDqh6iMKWz5UYMdZ06L2
	hhfpM59S069Gf3wNkrldxURWfxaHSFLeXD+0wJhX54iwrsYw4yoNR4S54h9znFItNqWuc5qPU2/8V
	lsX/hIHDY7LGh/ScdI4oHQiDRnSgTaOCiZPCanCp91iietaEB/x8cP5hxAkhv8WMwssxHmlIbpgf9
	sfgL+3hZ3G9jztJMXOkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3kKU-00033z-O3; Tue, 12 Mar 2019 16:32:38 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3kKS-00033f-Ae
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 16:32:37 +0000
Received: by mail-it1-x144.google.com with SMTP id 188so5547801itb.0
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gFPryUrYS7vffowFXQWUEV10mJmyY/YdZ7f1r06JmoQ=;
 b=dfKIE2NfkM1vbY8wnijPmACa8HbxZmobYXZDmNkxdvaGaEZ8xhN3UWs1e5MD/S1WJ3
 isFQXldV6Kq66t3wBpaQh//8qrpd4KbKtwlmtQW9fcSxwc6WhI0Yal8D8PtyfkVT7i2Q
 mXncVCDhyRqm4zCBrI4TbuQlXpKN/edSJkFc6UCA7vjl6mvm14XKJvijbfsxcwck8IFr
 lHinf+2v9e/2TY610VVnP573iXUcRprUwaFbh1fL3D93coFWL0QqAYIssazHNkwWWOYk
 jKWhBHKRoamWqkyO8KPdt+j4pIWevvmnJBAoKTGMJwbBbCxNLQH+Q0+YgGlAH6AMUpoX
 lnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gFPryUrYS7vffowFXQWUEV10mJmyY/YdZ7f1r06JmoQ=;
 b=CfrAFrxnZvCrwr+QcPqs8BEYE5xgEkIn4VlGZc7TJkrTtBhbIt4tteM+6Wy6bRPn8S
 FhEbnc//1rovlCI/sQwZBmSenhzwbIXe3M8LVbX3249HBEFwzU5P9MKOf3aQ2Cw5xjRR
 uR/jAaBmg7cniDeuadGs2FT7sFZQsfzZrjJNt6rgwT7lJvi/Zs+8XLClqaThRuonuU97
 1rPkLEZQpEhVZuKyKRuXrWnC5sjZRoqKxUOeuresNbYiySmSJFI0yiHITqdj3kN+T/SA
 MGi+R5EtMt3yRm5WtHjMmzTK3ItnmuMRuy02Ct42YvIKHNSZJDuWjJN7nkzonDlvZF5R
 XgSA==
X-Gm-Message-State: APjAAAVRs+iXb0RlTsbmQmSEtr74hu8ueHzPiuInV1dohTaTgcvLn3Ni
 1O0McQ2I+sXIvNfSjx4nzOZliA==
X-Google-Smtp-Source: APXvYqxLp9h0zjtRF4n6JGDP+pxpQKCzjZToo0WRnbmWm4O1Rkk2ahbUchLqaTOdbBFuAnv/WCCroQ==
X-Received: by 2002:a24:1947:: with SMTP id b68mr2327795itb.121.1552408355047; 
 Tue, 12 Mar 2019 09:32:35 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 f9sm379431ioo.24.2019.03.12.09.32.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 09:32:34 -0700 (PDT)
Date: Tue, 12 Mar 2019 09:32:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 0/2] L2 Cache EDAC Support for HiFive Unleashed
In-Reply-To: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1903120925400.26459@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_093236_365451_9F5CDDC5 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 bp@alien8.de, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Yash,

On Tue, 12 Mar 2019, Yash Shah wrote:

> This patch series adds a L2 Cache EDAC driver and DT documentation
> for HiFive Unleashed board.

This should also reference the "FU540-C000 chip" since there isn't 
anything board-specific about it.

Also - could you please describe in your patch 0 message what kernel 
commit this driver has been tested on; or, if it's not a mainline commit, 
what additional patches are needed to test it?

thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
