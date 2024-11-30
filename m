Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0413AD73602
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5bIQjyLHiSF0bfz/0Vj5Wog6gf/5EIDrvRYAxnSNU4=; b=NEU1glI0W/CiLb
	4+grGh+cG/7VR4/m79LrkYYqz52L1hQnq6jn3nv1i0FFw+MzuoGOoqCCCzR0qRFhGGGiU4qVigu1E
	wEwr0jBJpTLsvOEB3LGFnvupNoR2gl1YcESYqdn3gAK9vrU1uJNzvBM1Ye8XTJg6+cTjN4QI3T2OZ
	CTSqylkTpRHFIwchqrtRylEQfWnQGDxyMuIomcNjIMokp4NnS7c8mEbnzafWI1Rt/G1gxwgHdOMq/
	ko9nu9C3efFg8UtEsOAes9ODMfXC8xhMBucxMXbRKtQ4rZog263mw5x7PYx/K4NWfoQADItob5FL5
	VcETyzhFMoijKuivNC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMgR-000000021kz-0BgH;
	Sat, 30 Nov 2024 12:34:47 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHMgN-000000021kL-45LU
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 12:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732970067; x=1733574867; i=markus.elfring@web.de;
	bh=EKTFWHVdKPv4zouKlHIVlvi8TUgd1IyhKWUXdDSdmnY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V2xPQZWPLXe9pEFCtvBynTKYWcTalBPohQYBL6ON+lgniy3okqcdHc0J/hzVuIAA
	 2oeYoWAl5nPoULV/vu0P9YBOa9GnduWTxnfozb1NYnXmzaQ10I1JmPYCBFPdgfjzj
	 gR0rpvwNpgA68gnJgMy7rOi42KxTazX7TwcCJknQkeGeYKCsJycxML/+ONJ6iKqni
	 wP4Bzg0Xh1hl7MJryCR7XZZJimOmuYq7+KVOr7oNJlBI1uYiqy0OkLHwWsBubB6tO
	 s9iYK4OkVSWBI9s1oRUn+senIO0CXhg/4Hcs63DUUm+2xMjwONRZn17hN7fQoIUxX
	 4uKBV0X3qge8lGCHlA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79N8-1tlKEZ0D3E-017cg7; Sat, 30
 Nov 2024 13:34:27 +0100
Message-ID: <6fd72d7d-8a6d-46b0-a7aa-08111093738a@web.de>
Date: Sat, 30 Nov 2024 13:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-riscv@lists.infradead.org, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
References: <bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
Subject: Re: [PATCH] mailbox: th1520: Fix a NULL vs IS_ERR() bug
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
X-Provags-ID: V03:K1:uxeDcr6BH8BxBkN6tuLsL50ywJWugil/p7X9C1bf7AWIfWPi0zi
 rsYjH2uwJEDsogJzQcV+vk9mn57E2LNDPOMkVHbcx7Y9LNHnb6WoY+1RM67VXs4o+bS3KN0
 tqbxL8QzDJbDfQO+NsnFMDiksz00Fgue3xjDETmMqdsI5Lpn9JxbTJbGD0/pcVkovoVvumY
 AusXQqaPnE6C6ZgXG3p1g==
UI-OutboundReport: notjunk:1;M01:P0:V0SMgdf1a7k=;WA/kuaWxdjyIv3fUoke2JJqcdTM
 0T18UrQgQ2yfyPRY7tJwuKhWtjE3whwJVbdlAvOsxeYym3jtii8/pdkw39fpw9tU3EYuk5k10
 CKcEyo1jKTdbduccRKXb/CIf+wDsm3+260wehGpXgpBG3um5tK33HrcGNETcI7VPIHqa7Y+I7
 zvorhSoh92Zxe0AjWbQD6OSMBNKaTuXMITyoODIxfaArzqTuGFF0TUslqp9zF5vTRjLNviR40
 oU7kuhYvD6nvlkSotIU6sNrkdAB+EzZIN+VxZKiwtrDlCXgR70iax3HpF5icjyJ4vLm3YX5h5
 kmLayr7nVTqgXDnGq6e5UV6/A1j3n7GYNmJefgRkKv5t3u47WNNRArEPF9YODS1YdLGCkeYyx
 3ZVAQaoWg0J0bsJev03t4oulO7AqTUe4nJ0L5DplvRlXXEQLuZUIusdeTipF3nvCy26sxlWja
 4f+Dz13kSU+kKfLM3E2qHtuy4QJlV3c1rJSEXIMtr6jqPA4livJVcIu8QtD0nLLteb3yAgr18
 8ZDEt05pfgjlxOjs10RekH6or0U2W35oMPgs4eXgHa896kiE5z+czjpOcKcsqjc6AHIf7y9Ve
 muag1vpxlhZN8To8QxVdCvJWX/QiYOLubmiF4nHfp3vD0SO7GeXfIrtCZE6tp1ItOEbrqSPkQ
 +HUt6M8jU2YoTXcS8v7YtRM72Hl/cQBr0uainDDjEb0WYzHhQPLB91sjTjHCbwdzoxSfYMKfR
 Z2X1WeSFJIlzuY8QDDM1MhlWJ39Bev6lh4Z8EeU/cb2HSMyPaCVmGlleRmG8AuN1kktQNQjGl
 1zAobMVWngetpqmqFfn3DfwPnAhReBui7Hyuj3jjHWD8E87lMe1zmedwWoTXJhyVvnguQa/BD
 edpwwzTJaZKmQt9AjaT0IzmvJ1m4BQUXbZUJ0UimDc7qS6se9pwBXma5l/W22Dj1icKLivjTl
 xcQlntQnkfIueMQKJ3i3KXTxpt3M8rv/5BRrl9RNa8ROQijas75dGaY6i4Gu+LPzdjRixeQSq
 c3bxXawLN/sG7Qc6AyIOKxbT0iNmkJDtLKSVj43ywiJ9+bJgIvpsoSda8xUt6JIoY3bzT29OQ
 QSAJwH3Kc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_043444_388489_B2FB7125 
X-CRM114-Status: UNSURE (   3.52  )
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

> The devm_ioremap() function doesn't return error pointers, it returns
> NULL.  Update the error checking to match.

  on execution failure?


Regards,
Markus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
