Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E4DC021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=Q/GJHoZuW6utcp
	JZ9jX31VN219lIE3jLsHAahqPRtTaHCOJll3RiJTDBrs0fRXymt0uUdatCphOTdBGvZfCtm/rNsL/
	2N5elAy6aPRFBER7phNxw2f0CQ5+KNu2H++nbLM+AoXMSp/IYQrVS5W/R9SSZuAWcXyiYzAeu2YCW
	SqL0Btz1xee2RhVzGE+L00lVZVdM0kcMaClDCLbe5i0FUENbCeDM7fvKRqko2PbTIgNqohBSFAYmz
	bJt9z28W50lxT3JxT2HM1De2nOR8SbCk96ZZBqudK7GAFdkYTeIbhZ8tnXRKqTPHQExTcj6utNFVl
	i0LswnFEtKuDyGNdH2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgKX-0000000Bpwl-3BIy;
	Wed, 19 Feb 2025 09:25:21 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkg7i-0000000BlA0-1ntQ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 09:12:08 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id A255025AFA; Wed, 19 Feb 2025 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1739955992; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=Vd3JGUtTG5JM+dz97v/5hp3n6wRLMfN/bx3rWJPpEkkubcYVaJ1CT/ktNLMyaOOAe
	 909cuC3GzZ0rgjRS2AOXCNp9+4Lzxqzuv5vJQ3qz1jEu3eooW5iHxerAq6y1zf2iE0
	 3eiM4QsPEBRj9KalTbrCUIYAxev/OBordZLA4q346hcqzTTSat/hMfC27kp1/N+m0v
	 7EisrVMgg4nqnmPEiFtqXRhvzLl3eMuZDyhgahBsodqcxpkPeNB/x01eEzw42dSBn+
	 C6gv+AByAfreEG39xu1aRu3xLWj7V1Z+rydTxKu3SKvKkN+vL/4q913QUHReax4Gvd
	 NsuumZodggKOA==
Received: by mail.corporix.pl for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 09:06:02 GMT
Message-ID: <20250219074500-0.1.h.4dzw.0.2soxd9olen@corporix.pl>
Date: Wed, 19 Feb 2025 09:06:02 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011207_162282_F879FF39 
X-CRM114-Status: UNSURE (   1.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
