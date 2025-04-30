Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748C0C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I99uky6FqZjfdFPuN8dxzLuDnJcJt4mTGrsZjk7nd+E=; b=U4Be+JrDl+pr7U
	iK0hRhPo1nEmGV+XSg0ZxFsNiV9VOuPoPRAlOBGRRKh43IkV8kS8PBvqg06lAuHnQ0puDXpfoHc1J
	YngVAmWsBsKd6r1WFgIBBzfrz1xZSyDUr+l/5c3U9xV1lbf4UBULRCCM3E48IM7MffQj5CE9dtbqY
	Qyrl2ZPNfISNoD7/YAPfjoZaa4jEQDavg3BYRFy5eA1VFjFaEepkAXGkRIiWfhun/AZYbT2Kxnx0L
	H52/eldVVT5Te26b3ZTJmI5qF16S76mZLg49+vdhEmka4RjpDfKbKBEyM6q4658R06yijMZbJuG2U
	9+XyZ6pfGSdbwLc3+Fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADi5-0000000DskM-2brX;
	Wed, 30 Apr 2025 20:07:13 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADi3-0000000Dsjs-131q
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:07:12 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso381803b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comspos.co.uk; s=google; t=1746043630; x=1746648430; darn=lists.infradead.org;
        h=list-id:list-unsubscribe-post:list-unsubscribe:importance
         :content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWzNu01aPTRAtOaC3E3QKPVZi8ftwA47OKiG8590HAQ=;
        b=K8jwkSIb7IwG2yRd5Dl0YrhdFT0+/9JHsQiRnBuyawz+o7F0M1k22DE8h7QYfN4bxe
         tkwei5oCtcKWdFO/d4f97sZOKOuzQ8BKnyXWVP0v82P2O6NFlnQvbBI3v522DwM7cfbJ
         p0rkEs2XcsbY1F9m0puWSi+QnfPJKPM56LMOIGemw1aPDzpcJsIg8VH/tDnbFOJ8I5OQ
         C8XCZCp6RYqf34pjierBtJ6YmgOf+f1b3YE3daIR2Uawjc2qGSRfs34xjiS7RV/vg/Gn
         BYXh03zwKBWOYmHEVYexGspPfeK6M05FIrVoemytPykN2+qswa8OAfhRIhUcIhGPCRQY
         ybtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746043630; x=1746648430;
        h=list-id:list-unsubscribe-post:list-unsubscribe:importance
         :content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWzNu01aPTRAtOaC3E3QKPVZi8ftwA47OKiG8590HAQ=;
        b=UnLUwttggx5eMxLMXQ1cqGHPnm7jWtrE+/milXd1sCxuTGow0gqZQBZDYuUA7FddKE
         6C5hygUeeZfCOW0CoOXioPER/NHm5KefYxSIWK/UsHVQjc6+dzIpWxv+nH/7234VQ+KU
         ioqgGdsKNwt8ev7aH6rZ6qzjibN3t9jUYcKigallfwqQxSmpvPL67HxaxPmpeSDudxEr
         z1qARk/qPHeiW5vOsXm56jg678iem8RbA6WtRV1vaOKTdROWc0biiBTCGizQedl/Gr1+
         ZsxwLlFjoSLzVuPfD0dOIJWJrW87XU6sZHDrblbGElDqYKZvx7+5u6WHPUSEFWqG83lx
         xq1g==
X-Gm-Message-State: AOJu0YwO8XufSUDwHN36J1JGZemv6Gp01KAXlqdB9jk8duNmb9qm3abx
	u0Gnn8XwJKOxdUDSwruSOKlSxpON1wimm+qQXmQuQKpgNKyIR7Fd9XdgBz1z/7Ptlw3bwIe5XnM
	1VhU=
X-Gm-Gg: ASbGncsV9r0V6RRUkRpGnUceX9CsTJ2JkXD1IQBjvVQRGDdIC7+BlYtQj06vqfL+EVn
	gj4aM0/vIvo/2sCJE92Tw1lm3psrw/R4G5ibZmz7I9BRHPRNR8vq1IzxkmdzGhxU+HXcj5NIMJA
	bIXK/ZiXbumxqa879YhL+eLzbZiOGZKJymOrFvbGDkCGkdrGwj1FkP+EpMsWBwL4e3sHZu8ha8B
	LsG6NzjsegAOBJVnue8Y5Of63ATn6t0FFKYTON4o10OUaHr9pEXa9wlFR9n4e5xCGpCpmBAsBtH
	Jyva69e7Vw+48wQlV7Q/k2i9pecUYbJvDTQ8TrY0gwd9kwn5xYKuCFiCgIaXnkGAObqTno+Pe02
	Reg==
X-Google-Smtp-Source: AGHT+IHeeteCVHhcgbrlA4zUJE4xsQRSIEU9VCU9NhzOR2M9lbucEd/LXHBXDxgo3ij5sykxK24UMQ==
X-Received: by 2002:a05:6a20:258f:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-20ba6a201dbmr824280637.4.1746043630025;
        Wed, 30 Apr 2025 13:07:10 -0700 (PDT)
Received: from cymxujz.fr (ip72-208-177-251.ph.ph.cox.net. [72.208.177.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f84a233asm11154591a12.40.2025.04.30.13.07.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Apr 2025 13:07:09 -0700 (PDT)
From: =?utf-8?B?U0JJ6Ki85Yi4?= <sendonly880@comspos.co.uk>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: =?utf-8?B?44CQ6YeN6KaB44O7U0JJ6Ki85Yi444CR5Y+j5bqn5L+d6K23?=
	=?utf-8?B?44Gu44Gf44KB44Gu6Kit5a6a5pu05paw77yINS8y57eg5YiH77yJ?=
Date: Wed, 30 Apr 2025 20:07:06 +0000
Message-ID: <IIHNAHHHIBLKBCDPNABAHOFEJHNE.sendonly880@comspos.co.uk>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-Yahoo-Newman-Id: 631de052-f381-4b80-885f-c3470b8bae33
X-yahoo-newman-expires: 1743692400
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_130711_287324_CE17148A 
X-CRM114-Status: UNSURE (   1.67  )
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

5bmz57Sg44KI44KKU0JJ6Ki85Yi444KS44GU5Yip55So44GE44Gf44Gg44GN44CB6Kqg44Gr44GC
44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuOBk+OBruOBn+OBs+OAgeWPo+W6p+OC
kueLmeOBo+OBn+OCquODs+ODqeOCpOODs+ipkOasuuOChOS4jeato+WIqeeUqOOBruODquOCueOC
r+OBjOmrmOOBvuOBo+OBpuOBhOOCi+eKtuazgeOCkuWPl+OBkeOAgeOBiuWuouanmOOBruizh+eU
o+OCkuWuiOOCi+OBn+OCgeOCu+OCreODpeODquODhuOCo+Wfuua6luOCkuW8t+WMluOBhOOBn+OB
l+OBvuOBl+OBn+OAguOBpOOBjeOBvuOBl+OBpuOBr+OAgeS4i+iomOOBruato+W8j+ODmuODvOOC
uOOCiOOCijIwMjXlubQ15pyIMuaXpeOBvuOBp+OBq+aWsOOBl+OBhOOCu+OCreODpeODquODhuOC
o+ioreWumuOBruabtOaWsOOCkuWujOS6huOBj+OBoOOBleOBhOOBvuOBmeOCiOOBhuOBiumhmOOB
hOeUs+OBl+S4iuOBkuOBvuOBmeOAgg0KDQrilrzjgrvjgq3jg6Xjg6rjg4bjgqPoqK3lrprmm7Tm
lrDjg5rjg7zjgrgg77yI44Oq44Oz44Kv6YCB5L+h5b6MMjTmmYLplpPmnInlirnvvIkNCmh0dHBz
Oi8vc2JpLnNlYXJ1Y2hlcm8uY29tDQogDQrmnJ/pmZDlhoXjgavmiYvntprjgY3jgYzlrozkuobj
gZfjgarjgYTloLTlkIjjgIHjgrvjgq3jg6Xjg6rjg4bjgqPkv53orbfjga7oprPngrnjgYvjgonj
gqLjgqvjgqbjg7Pjg4jmqZ/og73jgpLkuIDmmYLnmoTjgavliLbpmZDjgZXjgZvjgabjgYTjgZ/j
gaDjgY/loLTlkIjjgYzjgZTjgZbjgYTjgb7jgZnjgILjgYLjgonjgYvjgZjjgoHjgZTkuobmib/j
gY/jgaDjgZXjgYTjgIINCg0K5pys44Oh44O844Or44Gv6YWN5L+h5bCC55So44Gn44GZ44CC5YaF
5a6544Gr44GK5b+D5b2T44Gf44KK44GM44Gq44GE5aC05ZCI44Gv56C05qOE44GE44Gf44Gg44GN
44CB44GU5LiN5piO54K544Gv5LiL6KiY44G+44Gn44GK5ZWP44GE5ZCI44KP44Gb44GP44Gg44GV
44GE44CCDQoNClNCSeiovOWIuCDjgqvjgrnjgr/jg57jg7zjgrvjg7Pjgr/jg7wgIA0KMDEyMC0x
MDQtMjUw77yI5bmz5pelIDk6MDDigJMxNzowMO+8iQ0KDQrku4rlvozjgajjgoJTQknoqLzliLjj
gpLjgojjgo3jgZfjgY/jgYrpoZjjgYTnlLPjgZfkuIrjgZLjgb7jgZnjgIINCg0K4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSAICANCueZuuihjO+8
muagquW8j+S8muekvlNCSeiovOWIuCAgDQrnmbvpjLLnlarlj7fvvJrplqLmnbHosqHli5nlsYDp
lbfvvIjph5HllYbvvInnrKw0NOWPtyAgDQrliqDlhaXljZTkvJrvvJrml6XmnKzoqLzliLjmpa3l
jZTkvJrvvI/ph5Hono3lhYjnianlj5blvJXmpa3ljZTkvJogIA0K4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSACl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
