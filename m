Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0216C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VOvXjGQ88xGi2ppgsVz3hH6f9Gm/lIvOmTPgkyRx7Q=; b=pjFIC5bvgVdYnS
	px8LM1CqopX2ufS4X/OPnD9/oy8ZnnkPuf9hcfeZKF0O+Xv4BkDfBYXrminc+M9/ZGi0ezzC08Plk
	ROUO/S+ptYM73N/qrF8Fp6a1kZ5fe1/oPO7cTNXRnFCaLa2fHN75pMaez1niBeV3LMa162urgB2eH
	//70hv4GGAo04gXbZFhPfrQNPLTdTguAjztZsmClLMQkMIeksr7iYDDYZ9WFIFsWWI8bFkhwsjtfL
	HMzP/cKAlSf2FwneQvb9b6qylYBXCxmRMR7RRRQrxy83zaIJUJt++xSav2z/1O7Km9LdCgA1N864w
	BYmb02jG9IMPP7YRA62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuz7-0000000HSMH-1Jnt;
	Thu, 07 Aug 2025 07:24:21 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuxx-0000000HSGQ-224v
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 07:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754551385; x=1755156185; i=markus.elfring@web.de;
	bh=9de88VugsDPa/LIlbpkda0gcU4yY7d+htJ3VqGCOGgE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gBjHSuVfgC/vi/GNk88NmnfPQBzNLSCzNa8UfbElKnqXJE9IJA4Ip9LjvaZCYNl1
	 i/zNq3st4vePKRF0Kse3oX3XYgRV1ZfKv8MYZcabvtEXNmKwpPVtvdNZuJUN+A7+x
	 6dVKo0y6M+7h/9sIYDvWm4pFd76e4mL1X8zr6lUN/16kUdtLRnsIQfohB+QHbYciw
	 O1f7H63zT5Lwf2nvoHMCeSg8ion3t25kQNTk3d6uYcX//FinWOUgPuTWSAO/PJcBF
	 TTytK/S9mLQ0ydcGwZbasDlCZayWOa4XZ8+PEtYqq95bORfIiwFV14CQ5buQSeIiT
	 XzElQ891jo51iQdhHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MZSBG-1v5JRG3Zvq-00IGB8; Thu, 07
 Aug 2025 09:23:04 +0200
Message-ID: <effb29be-6d14-47e5-ab71-454119467750@web.de>
Date: Thu, 7 Aug 2025 09:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v?] iommu/riscv: check pte null pointer before use
To: XianLiang Huang <huangxianliang@lanxincomputing.com>,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <20250807033252.1613-1-huangxianliang@lanxincomputing.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250807033252.1613-1-huangxianliang@lanxincomputing.com>
X-Provags-ID: V03:K1:xXKAd9LN+7SrcX31YxR+DWd+PmSq61k7eWdXKUqnN2yiW7J3QZw
 RJpWlLJRRQMAjmoPmjGGbuS3he57QLxps7+hbJZ9wSrD0oWrVZAbiRZiIpblufjQq9yTrL3
 AHH6cxlSe8JRPRdswD9NMDuyZTXR5jqvhOCjddzvGMHMPlDu1Al4eBUBJiRVRyA9Id2DtJ0
 Y7x1mWOtCCc4Lewj1lbnA==
UI-OutboundReport: notjunk:1;M01:P0:zIrh8QRrPQ4=;lXwciPgDaLAizrl8IkBjNqDT8OH
 4cJOkDIbobCxg0ZclYzyM1AGCvt8kfnc8hSP3DVVn26pSv7Qeu9Hi7WoxF9bP8MSfIFer1CTI
 tGB3Tmv3EC2uyefAo8pNgNQCHaJ6DJyHizSov2RmxfuxKD75WUthKTbpHAygdSKaoYiyXIsyM
 Y8V4BNQajoZjFl6T53RYn95urAOnF/11jQ3yxRXYWev0ZuUMoVFA7GZ5EdpAKOD8DZoDdSwLN
 zoq51jOcbwyY3+b14XxpbwcULhRBVnG2+Wo58qNABNneyd38l+GrJPX0yrrVwtWUCzD54Ar4h
 BwwSSRAn9LhbC+mbAYGU7KuItjYyFm/NmqK7hSvB0dvca4glO82sBIJurmhsKaOonlxpfIEfk
 dRefnMMm6EG2hfAIVFRwOdaoozWB30GcYXUHxb3Ji2J1Ra03XpILbtuwr5eee3MBefuUjTZy6
 2NxzxDToCpqFy0BAYTV+ytRnmvWep7tD/GCxsHy0rmHUf61/GRwuF665GjUXiuk8Dn8H5qkjV
 YUrSW++aaTEnxYmUlh3l5KFmndiYt9R+UvLT2OfEOGaL0ub1O298a8QSTvds0rJlwzzGjutji
 L/T0RfgtgPT6lJIdpKgohLx0dverjkosJoVkFTHYWnxnIdxtKzGgtuz59OUA8Fq8TaCrOlNVO
 eOBVv9KS7QxFQd2UQLcHSyTj2Iz2R3eimL9wgLyX6LbNidmcImuRQ9GMLVQMa4YaWmbphwIbZ
 0HbOZ0A0+vsK/PAhpzrbH0Pu3UCY8dLL3pudOrDyEjMWbtkklIiZSxuj9GwJKBFeaZhbRcsT/
 WR6MdBQl5sMGpxkB8IP9rRkJ5D5J4G07gFrrSv4szRzHENjnHAdt2bdMje4dtvFOeafBcWcJO
 gISoXNA6zp4Beig/m5ElP2R+1utgZpaqTjXQwvOZ7pLNHQ4xK6bCXemBIeAj8cCOXEqbfuKQ2
 kIU8rKKJjQV27r3XYwjYxFGOJJN48djnTv4lTo7AJYKbiW1QAg8JR01/XzpP16Tsz9JHA7Yf8
 ui5cORfhXPTfrcR9jcy/h4vxfmiDszml+zMR6spkVnNLBncyY7BnZy6QlDD6gRatPdqQ/PLpc
 nFzVPIXuJ1GB0z8YhGulv77sdOtq5763vUWHHOvmwwcJpx+bfPhI8FjUkU8Ub2mEJYpCv/Dxo
 AoDzetJSh9XCU3yGAjSVn7FieJD2ZlD/cjMbW0TG6JtmoTuQ/uzRDPFGnnXz+yPgDYxCJ1H01
 Ebh31bPiJv+5Psx/UgEZDig45wavMxarJ52mrVfFJtQMxSHWrgix1l/C+QYCgMUUCDUYJguVq
 LQGxSh6EfeYSJob9r4fjR0Umtc4IxlVdXy9AW7at3n469NhLM7FaWZn55a9cabpFriRYjm6ov
 aH7fhNxJMtjDORk97yH4G9tak6Nyiht/EHtXDPgKCdL02HbN3FKJPdeNvqyfvHnPqZixWghk/
 YzA1vHNl/zcXKhSXn1cy8jX1Ok4xGxVqBtQCV6rxa+fM/lqIBV4LG8fnltIsogOwndPsEqHQ2
 GzAhnJr76HXDO+dfhfS54AcfP1vnfJp15FTaIbA/nAsWwmJdF6vGpqfA9n0V815ay10TRN6Jn
 luF+zMKQVXeHr/0n6WQUFk7g5vRUyRNuULYNQyUjrZKQ5yNZ8rGIG0DTLwJlQhbeU038QL+HC
 KEndaC4qgOwUe0s4301MByhqX330xcDVTXVjIsri5zxBtv3y7wmYSb8VyeWi+8fIOmACIaHmD
 xUDdeOuz4Z0Lim3daQ7CuA3lm+OFQcyUScr4kS1SSGHrDDW5tQtMM7P4NWvmEgyokDmYSDGvG
 1Hh+AGy5nfIUignyF9u6m3ro3dBRWN6fvguAwo0zajHd6ywPv5G74kDmUcnelGyvRh9i1c+oQ
 jYzo4PbEHAEvB0cIWZBzEPDkNP2IDPGYiiunlyPSVmZN5wpCz3xd1CIEEhIRJ0QGIiwxdZDpQ
 8j2y9RsvlXpy9P1c6sqf4voCwrzy2fzemZfPk+KZhFbmQXiNJf33J5aRc8TitJhIT4xmCV77J
 M6sO6Hi+BmajJHRwDaKEbn5p4CJxQccAvpozdmFa8i0ebV3bSlGY0MSBlHB/1f6GToAWDGqG3
 QWuO1V6Y7uYGOH4KDcu63aJz5QNAZdsl59SnCSP+HAtdBe1w3ooqKS5xAAK0au/Y2L83MXwh8
 8Hklj3B3mQ9Qgux9KP92q309JEH17CRUDnb7mrL7tZjiV2amqeB6x2XkjCbV8zH/xIdfbIUeD
 2hrH+fzYfGGOpeAUWH303M6ZOXh6asPrVe0ji4/Tbt8EezlfVmRLf2R1CJ4+uX6ZBW04tOS+H
 Jq5pLOMBJyjuYZvABP4TsVUZwVP5FDXz97rUyrsp9akCaq93cJwRpvz3+6VSpMBOVbfspqmtX
 alH7LN8QiWvGjbSvTVlfnnKdy+QFANOR4IRLY43RogXirAs3mtiOUhi/LSlO1bebGELghxBrS
 ZksUDrgI6sP68B5iTJ4Z4UUm68KEPajdBAArlR5kuUNRVS7sc/56kjKykKhKeOe7fei2gdmtq
 0gvuX/EEAwXiuSZhkXbToCmGAtwoaK4g99pscil9G9TZXfwR2SKL59yse+1RLFECiatIHW3/I
 SnPSuAnkU0BSykevz/Md9u7y5oCjo+MrWWcyDbWuByk4CPGScJpFAuNKF90E6SFibO6Ih/Y0E
 8SYbDH6K8ttYkimOUgTEsEcA036vE8n+4WQRqFS3YVrGH4qQZvCrNnccFkiIdm5GXHlBOqGxr
 5BbR6Pm/dyZABJOAnvP0n9ih+2gz6ljHE/tIQjbWsg+uRLtOk9eoCnol4NP1HlbA0XaraoeG6
 rROgHmj3xB2VK99mbyoYLp20CYz+UrNU4oWD2adpzWRuzQlnnkhUB7B1n5WbAeiCLx/Mwa2in
 8DbwmPu4KIQ4H2FzP/SB+Cr5J0jTuP6ESbR7Kg6DCtNFkYfLrZ4jyofBkpxFFu3WZanwH6ijM
 mU4j4z0EuaGb6TgXaYnteESGC/+seKBegwxcQOpJtLj6vCUu1rfULZa6rH7SCsmx4pnuh0+be
 +S1mH2Nbe792qN4CQLPhNRzFwvcvyqjdNfXfF5mRD2+kFEObBSWiKuyXgWcih0FK4dzpNmmtR
 l/P3mOdLyvHE3yB47YiC+7g/pZmBOhobHh1rp2aM9xSLLMmKiXozVYD4iRsA4UiWXV05RhHRy
 Dxc1UwbKJD+AIiX5AqKs7MWHM+B/7Ybap26hDHF+5+mBvd77oEdH+yL7iJxCmioYpnu+UP2U8
 QHfkHXgmeP1mXCRC95sGa1isIyNSGEWdA57PDTeHnmeXqXaytY+w9NemlqEnMusX53xyzeSEf
 Qx7E5qpaIZh3xxJmgqPjNkzO0BDizR5W/lBThcTMd9aWRZyd5rlyNaxKtnpxEXThtH9iuRs1m
 p9Dxq4UF1uNqJfFvlSlN7yF1DbKOLFAH3KIdHFar4f0RBgyMwsLWKuB98CAkMTdA8/K6cZ0HE
 M0ZCWZ4mxrYty43wFU/8+CUMNR17mGVU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002309_889280_3A61EBBA 
X-CRM114-Status: UNSURE (   2.77  )
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

4oCmPiBDaGVjayB0aGUgcG9pbnRlciBiZWZvcmUgdXNpbmcgaXQgdG8gYXZvaWQgdGhlIGJ1Zy4g
4oCmCgpXb3VsZCBhIHN1bW1hcnkgcGhyYXNlIGxpa2Ug4oCcUHJldmVudCBudWxsIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgaW4gcmlzY3ZfaW9tbXVfaW92YV90b19waHlzKCnigJ0KYmUgYWxzbyBoZWxw
ZnVsPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
