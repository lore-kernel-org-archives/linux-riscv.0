Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BA1D2ED10
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHSMiiJNy/fn5IDvU56s+Qbnp2XJMlq9l+E5jvWMPPM=; b=U2bAZR/kf1QSWi
	bWl8vFPZZqBVg2kEb/6Ybd852EcqXpPiOcueYQ0ykA1A+N7CSWIAeIJh7AKN1cDt4G9D6jPFkMWRx
	LfhoKPzCXV/Cx7lbb11pxNmHl6WOkJf+VraoH1vpOGvrak78Oih7yZwZvlitfzOFcZAI4Y63SjQ5Z
	xd6PUm97udRucLDTZuusQO0xa4RB759QgsjOMzmF71WvIGzMeAI32xVMGfA1CYqOPfZ62X5/B4U+d
	IlzNiuNOPfi2rbNKq4iQQQTpFOs1U0USY/TSyadEjVTw10BqpcOama53xMxSvkYDb8fek3cN1klSe
	L4phu0CA7QjJWSYwlTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijmq-00000006HlD-1HtP;
	Thu, 22 Jan 2026 01:47:04 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vijmn-00000006Hkq-3T1P
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 01:47:03 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6610ab85165so133366eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 17:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769046420; cv=none;
        d=google.com; s=arc-20240605;
        b=clRk2s2da0F9j/nDtyl8AO4UbYlHrlnpJENc7unAzzmiUjxG2b3co/XOyX0x+Lnnqq
         VrkNFVaBAGdmeo6oqY+WGO9hz5NwYaeOueeQFy7UOvMrdgamNUImzS3Y2abMh9X/WSj9
         53WhDmlMTp5kRgF+Cb1CjiFgD7ERsUxN0CmPnIKekHcHq9Pgngou8ZzpOWeWobk1kbfa
         Fv9meRBXlH77tQeQBJITzlYuwCf05GfQwk3Mavz8C4TVD5Nzq1OFX8xD+rgRNzrNYU+L
         LiTlLsQ8oCwv9pNLsb4/irs6wUAefgo+Fm7RAx2q6UKP4juqp0+QJo1RL5zGvTeHEh3l
         5dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9PTzoubPp4hDkja30sWF+suRnJHt7y0QXrdAbJ13kqA=;
        fh=n+q+gAj4ypZvOCt7UETJjSQ4S583GF8aqNrGxYrPbU4=;
        b=AkHTCoiHjOvx8KUkhJSrwmuXTqceGxfYs9sM0ldznJLP3rUf8pzbCQxKoDothCH9Br
         WA68KIkVWuZbysi/VTGgXNo33zf0VHPA26P8eNicBavW1r14oc34Uc3n86lUbKAcwRuH
         TpzzwDLxGhxTaGLZx8/0snEoImffWfsrEbzdoUJTDtxlrluKAI8M3mAoq2rqc9fDz7AW
         qddsEhREK4/g6B55doZGRZzFX3EOv4cSS+YwT0qNmef02qoYf9T3EJQUVxTGpktBwFBV
         1EwO/KHClbGLpn8W+QNLBD3K0ecZiXJvflPflvxLQ8snRKRfKH/yMG0+qBFW1WeTFfHr
         kLUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769046420; x=1769651220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PTzoubPp4hDkja30sWF+suRnJHt7y0QXrdAbJ13kqA=;
        b=TiXOJo3MKP6fcxZ3gAx7kX7+CQit7utGb6c770JXgop36W0oKSXaWUOPsYAMS9MscZ
         cPypGdugvWTQIfpKd/m6MbCUnTCD49oqcswb+lJLjiYT/Vj+Dxov4jUqeYlwAbmSR+Ph
         x4XOjZ2l9Hzj6z+ow16c5dEx6eilSwP/+1s4QyuqnicqMFoQ7k/Xszl06IH/xPPWW9ff
         2NOUkxs0cscXlar5ZyLNGVxX1Z6t4jpFBHUQwGUz61H58JXSOVk+YQ/at/HZw4efYCXO
         SI1a6jBPNKjnq+7B885WpZhI0rkptN9kPVf/TzQUVd6SAeX9uoN0+M8llNxKmG9m34Gh
         z8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769046420; x=1769651220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9PTzoubPp4hDkja30sWF+suRnJHt7y0QXrdAbJ13kqA=;
        b=FLDcytjDycGcgA52V3NjyPmrNS+udEWFbKuKXiHfjsAtoT+I3hLisZ8BRqfCEL3/XB
         tnKQBc9GfsQhFJodHZ9yHYkDXESg66MtcrNOqGtWXT0swkYF9jga9b7siFndI2qWvEW0
         5BFbwrrwaIwwBXxJkaGfKkPBLwR0i7SuwuXu2wJmleG9Z+D4SoqDANrv66mImIEjdDxx
         V19x7GDaOfy4NE3Uv0Z/PLj+a9Lq1G2JAP9eU4+9rm3pjpcsvb9i5Th88p0cOZ1fzB0D
         QH7G4YFYmOF9TPrAxSPPBMIUqgIINAWJfWei+dEzMi0GQWNIZ34l3qIwmY6VZKDVotdf
         rBbw==
X-Forwarded-Encrypted: i=1; AJvYcCVldPNKHHScibUFFIpm2MpCna4tXt8CF7pUHHzvGtxYtZtuKYZFCnvY2Uye4syJq99Y3eAFlrsv+Y6zlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDG8Dlvo2RscFx7Sc1doZQ59v+B2TVbBWejHTRDvUWQ8XlI5fN
	sY5pv/iPUCN/GOSEmOm7MjHsk2j2VFQcRdC8SCA5eRdDxfOYuNMwg0bY2rD47WIvusl8cJJryEH
	ipd8zEK8rTHepzyomDe784wGrwpyLexuaKT2poTjdJDoGzeI3LpZgN41syg==
X-Gm-Gg: AZuq6aLyRoNBrNDGdIKSCYA8i/6I7qzE9+E+k7R+oJ5OzxCEeNgNFS4Vi1sgfYFGmkQ
	bvOfgxKRh130vAfeUW3/MHDGFLIAoDfLMbJc7N6s0Lp1EkU5lEVW5cWF9r3oZ1jPWjTbBPR/JVu
	jc1TbyMjx6k+6x36L1SJKrbeYmKjhoCvPWm/9iXCkRDyNKn2D3bPYpvZY5n2Q0BrPiPl5V/MVZN
	AE0e7yMp9LPbjEmQAh+CoB7ze0pC9T3Uayw0ku1WxuiCyoew2pFeze2gXwch4OrMxDg6SyqRR4H
	zjr741u8
X-Received: by 2002:a05:6820:4d5a:20b0:662:b8fe:201 with SMTP id
 006d021491bc7-662b8fe0440mr1740999eaf.23.1769046420173; Wed, 21 Jan 2026
 17:47:00 -0800 (PST)
MIME-Version: 1.0
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 22 Jan 2026 09:46:47 +0800
X-Gm-Features: AZwV_QiJd5q6gXWC5pBl8iW8G0RoL8rDe_7SQsYQAor2KcNuj9vdHUwn-MU0KzM
Message-ID: <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, lihangjing@bytedance.com, 
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev, 
	xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_174701_908395_699123A8 
X-CRM114-Status: GOOD (  25.97  )
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

SGkgSmFzb24sCgpJIHRlc3RlZCB0aGlzIHBhdGNoIHNldCBvbiBteSBzaWRlIHdpdGggdGhlIFFF
TVUtdmlydCBtYWNoaW5lLgpJIHVzZWQgdGhlIGZvbGxvd2luZyBRRU1VIGNvbW1hbmQgZm9yIHRl
c3Rpbmc6CgogICRRRU1VL3FlbXUtc3lzdGVtLXJpc2N2NjQgXAogICAgLU0gdmlydCxhaWE9YXBs
aWMtaW1zaWMsYWlhLWd1ZXN0cz03LGlvbW11LXN5cz1vbiAtbSA4RyAtbm9ncmFwaGljIFwKICAg
IC1iaW9zICRPUEVOU0JJX0lNQUdFIFwKICAgIC1zZXJpYWwgbW9uOnN0ZGlvIC1zZXJpYWwgbnVs
bCAtbm9ncmFwaGljIFwKICAgIC1kZXZpY2UgZTEwMDBlLG5ldGRldj1uZXQwIFwKICAgIC1uZXRk
ZXYgdXNlcixpZD1uZXQwIFwKICAgIC1jcHUgcnY2NCx2PXRydWUsdmxlbj0yNTYsc3NkYmx0cnA9
dHJ1ZSxzbWRibHRycD10cnVlIFwKICAgIC1kZXZpY2UgJ3siZHJpdmVyIjoidmlydGlvLTlwLWRl
dmljZSIsImZzZGV2Ijoic2hhcmUiLCJtb3VudF90YWciOiJob3N0MCJ9JwpcCiAgICAtZnNkZXYg
bG9jYWwsaWQ9c2hhcmUscGF0aD1zaGFyZSxzZWN1cml0eV9tb2RlbD1tYXBwZWQgXAogICAgLWFw
cGVuZCAnY29uc29sZT10dHlTMCBlYXJseWNvbicgXAogICAgLWtlcm5lbCAkS0VSTkVMX0lNQUdF
IFwKICAgIC1nZGIgdGNwOjo2MjM0IFwKICAgIC1zbXAgNAoKVGhlIGJvb3QgbG9nIHNob3dzIHRo
YXQgdGhlIGUxMDAwZSBpcyBzdWNjZXNzZnVsbHkgYWRkZWQgdG8gSU9NTVUgZ3JvdXAgMToKCiAg
WyAgICAwLjc1MjgwOF0gcGNpIDAwMDA6MDA6MDAuMDogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDAK
ICBbICAgIDAuNzUzMjc5XSBwY2kgMDAwMDowMDowMS4wOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAg
MQogIFsuLi5dCiAgWyAgICAwLjc2MzIxMl0gZTEwMDBlIDAwMDA6MDA6MDEuMDogZW5hYmxpbmcg
ZGV2aWNlICgwMDAwIC0+IDAwMDIpCiAgWyAgICAwLjc2NTI0MV0gZTEwMDBlIDAwMDA6MDA6MDEu
MDogSW50ZXJydXB0IFRocm90dGxpbmcgUmF0ZQooaW50cy9zZWMpIHNldCB0byBkeW5hbWljIGNv
bnNlcnZhdGl2ZSBtb2RlCiAgWyAgICAwLjg2ODEyMF0gZTEwMDBlIDAwMDA6MDA6MDEuMCBldGgw
OiAoUENJIEV4cHJlc3M6Mi41R1QvczpXaWR0aAp4MSkgNTI6NTQ6MDA6MTI6MzQ6NTYKICBbICAg
IDAuODY4NzQwXSBlMTAwMGUgMDAwMDowMDowMS4wIGV0aDA6IEludGVsKFIpIFBSTy8xMDAwIE5l
dHdvcmsgQ29ubmVjdGlvbgogIFsgICAgMC44NjkwODddIGUxMDAwZSAwMDAwOjAwOjAxLjAgZXRo
MDogTUFDOiAzLCBQSFk6IDgsIFBCQSBObzogMDAwMDAwLTAwMAoKSW4gdGhpcyBlbnZpcm9ubWVu
dCwgSSB1c2VkIGlwZXJmMyB0byB2ZXJpZnkgdGhhdCB0aGUgZTEwMDBlIGZ1bmN0aW9ucwpjb3Jy
ZWN0bHkuIFRoZSByZXN1bHQgc2hvd3MgdGhhdCB0aGUgdGVzdCBjb21wbGV0ZWQgc3VjY2Vzc2Z1
bGx5OgoKICAjIGlwZXJmMyAtLWJpbmQtZGV2IGV0aDAgLWMgc3BlZWR0ZXN0LnV6dGVsZWNvbS51
eiAtdCAxMjAgLWkgMTAgLVYgLVogLXAgNTIwMwogIGlwZXJmIDMuMjAKICBMaW51eCBidWlsZHJv
b3QgNi4xOS4wLXJjNC0wMDA1OS1nOTJkNmY5NjllYjEwICMxMCBTTVAgV2VkIEphbiAyMQoxMTow
NjoxNCBDU1QgMjAyNiByaXNjdjY0CiAgQ29udHJvbCBjb25uZWN0aW9uIE1TUyAxNDYwCiAgVGlt
ZTogVGh1LCAyMiBKYW4gMjAyNiAwMTozMDo1MiBHTVQKICBDb25uZWN0aW5nIHRvIGhvc3Qgc3Bl
ZWR0ZXN0LnV6dGVsZWNvbS51eiwgcG9ydCA1MjAzCiAgWy4uLl0KICBbICA1XSBsb2NhbCAxMC4w
LjIuMTUgcG9ydCA1ODEzMiBjb25uZWN0ZWQgdG8gMTk1LjY5LjE4OS4yMTUgcG9ydCA1MjAzCiAg
U3RhcnRpbmcgVGVzdDogcHJvdG9jb2w6IFRDUCwgMSBzdHJlYW1zLCAxMzEwNzIgYnl0ZSBibG9j
a3MsCm9taXR0aW5nIDAgc2Vjb25kcywgMTIwIHNlY29uZCB0ZXN0LCB0b3MgMAogIFsgSURdIElu
dGVydmFsICAgICAgICAgIFRyYW5zZmVyICAgIEJpdHJhdGUgICAgICAgIFJldHIgIEN3bmQKICBb
ICA1XSAgIDAuMDAtMTAuMDEgIHNlYyAgNS42MiBNQnl0ZXMgIDQuNzEgTWJpdHMvc2VjICAgIDAg
ICAgMTI4IEtCeXRlcwogIFsgIDVdICAxMC4wMS0yMC4wMSAgc2VjICA0NC4wIE1CeXRlcyAgMzYu
OSBNYml0cy9zZWMgICAgMCAgICAxMjggS0J5dGVzCiAgWy4uLl0KICBbICA1XSAxMTAuMDEtMTIw
LjA1IHNlYyAgNjkuMSBNQnl0ZXMgIDU3LjcgTWJpdHMvc2VjICAgIDAgICAgMTI4IEtCeXRlcwog
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0KICBUZXN0
IENvbXBsZXRlLiBTdW1tYXJ5IFJlc3VsdHM6CiAgWyBJRF0gSW50ZXJ2YWwgICAgICAgICAgVHJh
bnNmZXIgICAgQml0cmF0ZSAgICAgICAgUmV0cgogIFsgIDVdICAgMC4wMC0xMjAuMDUgc2VjICAg
Njc2IE1CeXRlcyAgNDcuMiBNYml0cy9zZWMgICAgMCAgICAgICAgICAgICBzZW5kZXIKICBbICA1
XSAgIDAuMDAtMTIwLjA1IHNlYyAgIDY3NSBNQnl0ZXMgIDQ3LjIgTWJpdHMvc2VjICAgICAgICAg
ICAgICAgICAgcmVjZWl2ZXIKICBDUFUgVXRpbGl6YXRpb246IGxvY2FsL3NlbmRlciAzLjglICgw
LjAldS8zLjglcyksIHJlbW90ZS9yZWNlaXZlcgo1LjIlICgwLjcldS80LjYlcykKCiAgaXBlcmYg
RG9uZS4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGVuYWJsaW5nIHRoZSBnZW5lcmljIElPTU1V
IHBhZ2UgdGFibGUgbWVjaGFuaXNtIHRvCnN1cHBvcnQgUklTQy1WIElPTU1VLgoKVGVzdGVkLWJ5
OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgoKT24gVHVlLCBKYW4gNiwg
MjAyNiBhdCAxMTowN+KAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+IHdyb3Rl
Ogo+Cj4gVGhpcyBpcyBhIGZhaXJseSBzdHJhaWdodGZvcndhcmQgY29udmVyc2lvbiBvZiB0aGUg
UklTQy1WIGlvbW11IGRyaXZlciB0bwo+IHVzZSB0aGUgbm93IG1lcmdlZCBnZW5lcmljIGlvbW11
IHBhZ2UgdGFibGUgY29kZS4KPgo+IEl0IGJyaW5ncyBzdXBwb3J0IGZvciBTVk5BUE9UIHdoaWNo
IGlzIGEgNjRLIGNvbnRpZ3VvdXMgcGFnZS4gT3RoZXJ3aXNlIGl0Cj4gc2hvdWxkIG5vdCBjaGFu
Z2UgdGhlIGJlaGF2aW9yLgo+Cj4gVGhlIHNlcmllcyBkaXNhYmxlcyBTQURFIGFzIHRoZSBkaXJ0
eSB0cmFja2luZyBzdXBwb3J0IGlzIG5vdCBpbXBsZW1lbnRlZAo+IGluIHRoZSBkcml2ZXIgYW5k
IHNob3VsZCBiZSBkb25lIHNvbWV3aGF0IGRpZmZlcmVudGx5LiBUaGUgZ2VuZXJpYyBjb2RlCj4g
Z2V0cyBmdXJ0aGVyIGFsb25nIHRob3VnaCB0aGlzIGRvZXMgbm90IGluY2x1ZGUgdGhlIGZvcm1h
dCBpbXBsZW1lbnRhdGlvbgo+IG9mIHJlYWQgYW5kIGNsZWFyIGRpcnR5Lgo+Cj4gVGhlIGZvcm1h
dCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgYmUgYWJsZSB0byBzdXBwb3J0IHRoZSAzMiBiaXQgb3B0
aW9uLCBidXQKPiB0aGlzIGRvZXMgbm90IGVuYWJsZSB0aGUgaW9tbXUgaW1wbGVtZW50YXRpb24g
YXMgdGhlcmUgc2VlbXMgdG8gYmUgbm8gdXNlcgo+IHRvZGF5Lgo+Cj4gSXQgbG9va3MgbGlrZSBS
SVNDViBjb3VsZCBzdXBwb3J0IHRoZSBEWU5BTUlDX1RPUCBvcHRpb24uIEl0IHdvdWxkIHJlcXVp
cmUKPiBzb21lIGFkZGl0aW9uYWwgd29yayBvbiB0aGUgY29yZSBzaWRlIHRvIGludGVyYWN0IHNh
ZmVseSB3aXRoIFNJR05fRVhURU5ELgo+Cj4gVGhpcyBpcyBvbiBnaXRodWI6IGh0dHBzOi8vZ2l0
aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvaW9tbXVfcHRfcmlzY3YKPgo+IHYyOgo+
ICAtIFJlYmFzZSB0byB2Ni4xOS1yYzEKPiAgLSBGaXggdHlwbyBpbiBQVF9GRUFUX1JJU0NWX1NW
TkFQT1RfNjRLCj4gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay9yLzAtdjEtZDMzMTdiMGVl
Mzk4KzUwLWlvbW11X3B0X3Jpc2N2X2pnZ0BudmlkaWEuY29tCj4KPiBKYXNvbiBHdW50aG9ycGUg
KDUpOgo+ICAgaW9tbXVwdDogQWRkIHRoZSBSSVNDLVYgcGFnZSB0YWJsZSBmb3JtYXQKPiAgIGlv
bW11L3Jpc2N2OiBEaXNhYmxlIFNBREUKPiAgIGlvbW11L3Jpc2N2OiBVc2UgdGhlIGdlbmVyaWMg
aW9tbXUgcGFnZSB0YWJsZQo+ICAgaW9tbXUvcmlzY3Y6IEVuYWJsZSBTVk5BUE9UIHN1cHBvcnQg
Zm9yIGNvbnRpZ3VvdXMgcHRlcwo+ICAgaW9tbXUvcmlzY3Y6IEFsbG93IFJJU0NfVklPTU1VIHRv
IENPTVBJTEVfVEVTVAo+Cj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC8ua3VuaXRjb25maWcg
ICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L0tjb25maWcgICAgICAg
ICAgICAgfCAgIDkgKwo+ICBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L01ha2VmaWxlICAg
ICAgICB8ICAgMiArCj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvZGVmc19yaXNjdi5o
ICAgIHwgIDI5ICsrCj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvaW9tbXVfcmlzY3Y2
NC5jIHwgIDExICsKPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5oICAgICAg
ICAgfCAzMTMgKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgICB8ICAgOCArLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LWJpdHMuaCAgICAgICAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMgICAgICAgICAgICAgICAgICB8IDMwMiArKystLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9s
aW51eC9nZW5lcmljX3B0L2NvbW1vbi5oICAgICAgICAgICAgfCAgMTYgKwo+ICBpbmNsdWRlL2xp
bnV4L2dlbmVyaWNfcHQvaW9tbXUuaCAgICAgICAgICAgICB8ICAxMSArCj4gIDExIGZpbGVzIGNo
YW5nZWQsIDQ0NSBpbnNlcnRpb25zKCspLCAyNjEgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L2RlZnNfcmlzY3YuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9pb21tdV9yaXNjdjY0
LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlz
Y3YuaAo+Cj4KPiBiYXNlLWNvbW1pdDogOWFjZTQ3NTNhNTIwMmIwMjE5MWQ1NGU5ZmRmN2Y5ZTNk
MDJiODVlYgo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
