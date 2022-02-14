Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B02C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvZ+89V6xx9fyQ0pFW8AgOO/FsvZyz3s2Y4EFIDmH64=; b=Pp1IMOXsaM4jx0
	T61nK9wW4nF40Ssvcso+m9IoZUPoK84Ci8sZQDr07sqeP9WdTi8vCincbdCKtqQqUCselMJ9lIIjj
	fbSdEo2gOShjikiGMD2IMhuJYuNvP7NlvzKpclhDjjDrmwskSomtED72daCRIoOfOU5DdpRCU428Q
	jAq0jWgeIFlt61f3qg9BB3ArT4coe2uhudwcCei5FtwPjR3iB4iwhPEaeFRF8SCQgQqVopW23WaYP
	JBOE86VwLQtdFVs/L4LkRU1IqFKGy30x/jaFp9lvGyLglZNfPY/mgFVphIhGmJBfSHr2FE0BVgnaF
	ttKo49xRXSiLO6Pq8IRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJZnR-00Euuf-DO; Mon, 14 Feb 2022 11:45:33 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJYaX-00EViL-7q
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 10:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644834483;
 bh=C52L81Zv6DgbMZ32Hm9sPxd7zXF+yQ2jiwL8dR4ieg4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Bjje2Nkw/46y+07oJ48NjQs1PB1iStZpLEA0luaeFydTMqyuMA6klR283DQG8u1DL
 s868gB2p8ykG0mpFemuA3JjtjgeAYkTnuTdeDGDdV22HZ998OMk9Psc/6AQeJq3sys
 HhqGhq8Sd5VmgwwxFAYtrgMSZNN6BZHoWE6cHNhc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1nVLkT3WO7-00HNq3; Mon, 14
 Feb 2022 11:28:02 +0100
Message-ID: <49d3aeab-1fe6-8d17-bc83-78f3555109c7@gmx.de>
Date: Mon, 14 Feb 2022 11:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org, Sunil V L <sunilvl@ventanamicro.com>
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
 <877d9xx14f.fsf@igel.home> <9cd9f149-d2ea-eb55-b774-8d817b9b6cc9@gmx.de>
 <87tud1vjn4.fsf@igel.home>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <87tud1vjn4.fsf@igel.home>
X-Provags-ID: V03:K1:kWX1RyymCzZi3HShz7TOEYlEEIuEzCNmVUcoaTDwlboEDX5KwFu
 T11R6pzWrra/U18O4BDT+sVEhjcz8mGruHI8KlMlxezPRwjHQjP7BDC7kB7HE7wSbWk5dG9
 A2yqlqau3mBKveqkKrrIjPWTC6WpDX8zIYF0Ip/e/9ud3RGLLFFsmhrML5JLwj88Mx458FZ
 mehheaVewk32SY9MHOJ3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KC66DkQYCFI=:wQA4JJFKXXrX1a8BRD4tEr
 JxzhfyP1kgYWsyaLZIB/DSH8NSwddXSz70aKY7CMeiEdGWeNxqlumsXQ7Y0vyMZWA22BTQzW2
 im9ZOKKwpQl8sHuzxeXN6kqsNWNgwRzAJl2OhhjJp4nC1w3IW4c+Uaf7uvhTxT/585+or+Zg4
 bYfpuiWXGJAsdFDtDwUXFT6qfqd77h3DQqd0jR6jkVl2I1bmLIPOVlo7F0hDn6MeV2GnDIFth
 c2QDG1ByqWTFpEuSK8GnT4vH9UpX/u+ODhcM0X6cCO9POoid2LgXH66FOa3iM10lphkRaMLl2
 euXjSAz0f2+6wO8UMW9qZZG2bMmDevVT8yRlK7u0KLpvalvmYOGODVeW9depA+2J6CD6jZUow
 UePAF5uibEJpb7hyr0Vu82bYwQUUWrBg1llcJnszJONpZ9bb8Pm2v4iuAwqZ4Sd8GFhkyWptl
 3paP65/u5DE1JlTu0Y+2rHN7dwivqGxDc5emnSexU/lCblKXlzHlZakvcHs6XE5MPP27nkbrS
 +5egEHaUuvOKR5kyiFMfL+elSGXutclB3/1n3F5DjSzg+l2nobX1Uip2ZUYxIHujAN7hcWfOs
 TA6zf5U1s7h3Zs9dPX8vk/KseoaDZUXj3tXgkmwrv8VRH6iG9kf+6G2ozQuUADkuGvZwXSQTd
 hT3YjlsbGBzWM7V3tipIKIvF2FSY5XvbM1ZL72HrM+5zsrXRI31KeicPuzFq1xXFThQ/4TVMq
 HaHsTuUojGgeCJ8vT9oc9fKR+ONp+hdZLsaRdWDnMENmTBFybJkWircFKwDtz17rZd46GA4qq
 DMzQdoQj02CYZdy89t6XR0nJNVMLEka0PHYwUo+1jbWacvNzLHajOtDgj1kf5mufO3oRDEsa9
 MpHth3/GDs17vloqRmEl8V58diUoCtUGRmjtD25axHhB5CXAqi/uK4tW3YxmxKlPS03bF245H
 c7Ae/ce4WyLoRk3j/JYuOvLF/u8EMLgwVVCSuQESmEUSUIsxT40pwdHQAtD/5fhSo0Fjb4toG
 aVmWoKL7HHfEtItaxV6M3i+4Cc0dZw7karSRiGXmK+SES3GfN2uW0m3hjq4dOJlawTgNqYvk1
 g06tL+8GQj8gJo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_022809_653406_4FFDCB9C 
X-CRM114-Status: UNSURE (   7.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/14/22 11:15, Andreas Schwab wrote:
> On Feb 14 2022, Heinrich Schuchardt wrote:
>
>> set_boot_hartid() implies that the caller can change the boot hart ID.
>> As this is not a case this name obviously would be a misnomer.
>
> initialize_boot_hartid would fit better.
>

Another misnomer.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
