Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2275CA0FF7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCK0r5tFAfaLClkttNbL+UY7/FHdT432+iyNP9aMVow=; b=sN0l2dnT3cm3cW
	Pl4QwQMnV4jEgSORU23UgJEdpzpBPQZwg/90QNA4ynvjbL2ThPw2ld0nGDz7kwiil4j+9AlXlqrFb
	G+IUHV90yQYlQXiOyvwGL6q4GxsnQbL4sGXbDq5kcFL32KvSPWisFBovr4S8bu9KERlx0nIKEPZbU
	qaHR81ZIUNywDgTese/sO/KJhPMZ5XMK3ebHm0JFOUcEGPiTeLH0GtvEyq+HsuxJC1/4R2E1MYFyd
	Mls416blQ9mlybo0lBjlAcUXr+WaIy9guw/7icZ+c4yzqCnfPX/miubCAUYGQiXBDit693Sw7ebqU
	bzipSrbLh+uGV0OCsCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1fa-0000000DDgW-1toC;
	Tue, 26 Aug 2025 21:57:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Xw-0000000DD7C-1rXH
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 21:49:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDe1JH026626
	for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=GW7uBFTfEjLK1VD+
	jvcelJdkc9D6ELm3oQep1HEk63GXjAQGze8wezUoodAtkr4xi+hm1vjmixN0eaoo
	ZMdPJozGh+tGniRlZKtVl1AlZMYsRqESV39zfdp1M7UVc6BAF/suWs0gP1ub7YkE
	np1pOHkTc03QgmcyS7QXDEDKdem4JpdwM2KBuaXvGuMZ2qw5gZWnIjcAIGJKrLNt
	HcWp8bTgc+WvN+ghBCrIIMgeZuUh+pgZkyxL/b9Ta1rHtyYYrb4IqkyvIG3grCN2
	HnEpw+GWEEP+WBzz3K4tDfZmphSbo8b4397190wUll7OR044RLWLhULiGcQ1ItOT
	koFGAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umakdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 21:49:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174c8fd2so9272768a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244979; x=1756849779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=;
        b=JPVGpQ44uw5PnCDpQQlCAbfQOBV0x+uWd64Kh1RQ6RYW0HX5N0pIoBq8AoIsLWH8Z3
         fPjv67QEVHUDai6ps+kdjJJY80ocjBqVz8pwhQp4utmHC6NX5xFb7TxjMGBDCp9dkymj
         iQ2MbFN4l4DdZJvq/eMZ2P95/WqA6cSlYm2CH1LR+HWXWfeq95KCgq/72NarhhNRaB2y
         X87ZBf4Vnd2v7PHG3hJWxAbjD5SQadB/cmxTsRVgaO0/w6ci/B5KEJGe6gzUNzrSYStj
         cHD1nSfhBLU7L4xYOJcMsuCvl0OatxqzDI5xsfzKkXHweXHSdyK1p97AcZ0vaEwpcR/R
         Wowg==
X-Forwarded-Encrypted: i=1; AJvYcCU5yzTR4uM7WpQYThMR5wGZjq2Gx8+LtpnYXtTS5xbnaGUtYxJnXGlOnZvT2guGnmHNSaFMctQgSjjKpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmuyP52yc7hs+boEUc/zI9gPhDsIxVM98q0+nlxINdKUp8M83+
	W5EGgb14LXyH2PcD/XU74ljHXDYOKRd8xts/Z1CvH5SwAZisoLlMcewWxzhtea0ogGjuRAbESrQ
	xTbH2GdIf9Oaktge/aP+jTJVNuLG/LztIRjSWNodC3X0YcOARznSITIXIc9YWqU3x10C7kOY=
X-Gm-Gg: ASbGncuTAZFo0QPCWPz7vxD5K2rsDWUv3VtB7IiNeoBnwHtm682/hq5feQYsa6nVc1C
	Woeq+fvHgGlvpklpkillpMb5pqsnwtmO3OJW46VBns2lkefj71zPk1y7zn84u/PAX7e6sDfVwPC
	GVJF18OGcFJpHFB1HKd3Ge8W5yBoeWMPr1wktefQk2tCWBP/KGl12XsfeI6fK9/7yIz2/JE7LOy
	1X82QobHylSP5pbUFrKa6NorNRDdwixBMsCEhyZy1jBjmG1/U7yFiZMAzT8ZxW+wHo/FHt+/SSJ
	RLBcQYOKIwvIhL31UyXmHcp++rW6CXGVWiItQYzfaQ/DnonjwL2I5/XK9Yz/LRdjFsfNoMljwjM
	L+MvwNy3uPtUvvm70/2mSOwE1Zjl6i3+E
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163097637.1.1756244979120;
        Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvW96AUyv4NFuLjcj/uDmOR3GBBgYMnkq5H/IYhcNWvdPPtmf37a1KlGOYrRmV7mrjTboe3Q==
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163064637.1.1756244978686;
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm5860905a12.4.2025.08.26.14.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Message-ID: <e43ffda6-4d25-4874-99b0-6a65fea4a261@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ae2bf4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ZGSs6mt8D-bwwmi9yLIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX1q65gzzafsfT
 ueGW4vyC9hJi7DwuxJ43cFk1z4Ytqe9w18FVOIG4A3oPvvK7Pq/+1sW2C1v/iAWaw1lsA4PxI2G
 a16iNswDY/2nkZEWHlUO7tANVCHN5f9HsFZVBlIcKVKG0ME40s6yS3WM0iEQeqSHR+EeZj5vc0m
 0rkhZJt6T1qsOwKMZjV9Dgd2r6M1vIWH/IeO+cJ8Q5Q280UDM2UhgqRCBJFSP4Vne4R4RB5PYgT
 qzDzOC1wrSjDl8bppGZkFvFWRoeqRYl5NYqIQLF6CuhYjcTGNiipau55KjYou87sukAQkS3LjI1
 yNluXhWMUkfSmF7vubbxNK0vneD0tlSWLjNa5soPV7bQMDXYSVo+QiwsBZ2hqoTGgAD3AgmtfBk
 T3vTG7AJ
X-Proofpoint-GUID: bFAsq-LNO0eOyiSb66CkOelG6HusLR4T
X-Proofpoint-ORIG-GUID: bFAsq-LNO0eOyiSb66CkOelG6HusLR4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_144940_490197_2EEE888D 
X-CRM114-Status: UNSURE (   9.55  )
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

On 8/25/2025 7:25 AM, Kees Cook wrote:
...
> -config ARCH_SUPPORTS_CFI_CLANG
> +config ARCH_SUPPORTS_CFI
>  	bool
>  	help
>  	  An architecture should select this option if it can support Clang's

nit: Do you want to replace the mention of Clang in the help text?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
