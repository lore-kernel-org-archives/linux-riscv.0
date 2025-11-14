Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5659CE7B08
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDn6XfhK5+f/c6CztQBedYbFxpNOG3rEm6L4yWasccY=; b=v4nPlAjSrMn7Ub
	7CfV41dhunlOlpUODfYQpNJ6o127b7Q5DIFVcsAt77eCm46u3RtI6e9C+CEbnX0FjmCuZtttKnLzR
	sWv4Lyze0WEHn2RRHsfq68s8X98C/zo8wEntHrNmp9w8j4xdFMt84MiUAll2PhSboV/hn5CmJd9Vh
	dmwazrXHTrvSrV39ADUw6Z63t3mZ8dWYjBbJVBjxvIpqRnRL8f3E6hN3+Nm7CNR1cMjVEyFAXTDDg
	0iDa4bt8QvzeUn0eVKYkKtVknDE6bvYvS8jf1vPOkHkrwkA97X1wS/QxQypRaeA2ncPX9N92cm9dV
	VlE8MOvdVlPRrHAiP9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtug-0000000CGL5-2vYe;
	Fri, 14 Nov 2025 13:32:30 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtuc-0000000CGJn-0OZQ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 13:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127077;
	bh=6Vr7eNrXe06GaK06K8cFUqsyw9DPvxY9Y0LbTUQ8oEA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=boUcVQByUEQB95sYx5zjQmu4wRgprMz+TrQFhlH6RnkdkoCHl7CX9PIiFWws+KoHh
	 RUvkHXykFrdkNmCeNc8AWVRVXtfWCx0nAjEAWHNLWIVXykNRxBXSMX7ESWFWkSN4gP
	 Mwm+sMvbi1qSe+cKCel3rOp2tJ0GwL1D7odru9Tc=
X-QQ-mid: zesmtpgz4t1763127075tf42899c1
X-QQ-Originating-IP: wIUc43NDT+vtn9rrX6Ymr6/Wn03jy8ZmRjONmIhfR3g=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:31:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10954986891886735329
EX-QQ-RecipientCnt: 10
Date: Fri, 14 Nov 2025 21:31:13 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <7D3550E24A1FBD6C+aRcvIfIPOpJGFnJr@troy-wujie14pro-arch>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
 <aRZQfqFjDNds19by@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRZQfqFjDNds19by@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mi8ofykAS9CFf0RIZF+WOZbXs1I6FTpc7WsDqG6mxgCaUBMBS7+Lo1C9
	ir5Ysbq1JBIzxv4QgBTt6JeX8TjUFCtb9PcHNyHMCBlx3PoLowaKF2axBCe1peUHhz6FokC
	e3OxPlCp1YbV8U1O726h2S92p9leKhpBR0nielchcXrQFRZu63pP4a+h4Cx+Kc/lYCb/oXO
	4fpyI1n1i7G4jCmZfhI7o/vsD/lFR9oN9jebhEbhzhUfUyEhCI+k7hdwj/9RC/MAFiFPEo+
	iHURtxygJleAnfUFAa+7y576ftvu+2CYbQLioOx6cqU2KClsRUOULZLL78UblMUOP3H624D
	/1rw7NOwyXL6q9MFgli11hVc21nD0hhtFYaojj8hYqKNxnZvlKzbUIK7j70PAshAbQHZTLO
	URJwGmmJBGZfSBhYLC0glBBd+ftPz1abKPrNrJ0g5eo++JqFGw/lVnn7OCtE795ciNaJ/TM
	do90kGN5vqsyUbJP9KWgu8vSkfkJaHbkMBE7P24EaEjXstH83Oz5Agwcdwhfy7CKkL33TGQ
	jBPkAGqJaCSUqiZn6kSb/+VLn3Vqtgg998KZZUlLfxVOVXrJhZPovlRdVxlwNXiveKatGqV
	N2LBMRgkNz+GP98uWUbHIrtEHnOh1xSOMDRQ36tgYlHB+LKtJ6qTAoxRztRs+SVO6rM2l2c
	UwfVph1GkMZoKVu/wlxWI8eR42iGTKlIL9qoIcWp5Tr9Mpwa972fxDIgei37zFjHeFm9iPK
	t8ONgVx+m1fqhM8wcVZmi6osqKQ6MFUxXgGghjcJCn2vU/nKVUhxO4GG4VG4vG3saEIuBC8
	hoUBpNG7wwmlIpLMZyU9LyduHHsMGfEF70H6sO6CmZO7QQPsHIZBobVs/exurV1vXBggjYC
	kcKvv0MxjQshZjvVY16XTeFKtdOmvryqmLZHun7RlPbAYBGksBT8joNJFR4AVh6fPZz2JOS
	UReb5qyS2RiRzYrG4Sgynupz7tR3M37mhL7y9nMHhOzI7M0reiiXWfESqGR22U7nEemuvAb
	KLYAK9WZfcT6CWzD8y7g9/GsJl2rPvRMV3SAs9hQ2zJvly46d5agDkJVhhiPU=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053227_011471_46D81874 
X-CRM114-Status: UNSURE (   5.28  )
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

Hi Aurelien,

On Thu, Nov 13, 2025 at 10:41:18PM +0100, Aurelien Jarno wrote:
> On 2025-11-13 21:21, Troy Mitchell wrote:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for your test and review!

              - Troy
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
