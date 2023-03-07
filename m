Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51FCC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 01:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQIl44IpSeYDalDWfOwfK8qrtFbE+yGxhfRz8rRGECU=; b=FW0+UEA8HCOy7U
	pJm7Uz1a01FAexNjr4sGBS3LyYGvnerqt25aJGWA7VQlkMycV6PrATIo++lW5IdIi3gvYjR0n6j/Y
	9hJidL7XzRRwfPPpYRBPXB6aomCAZxM21t9wHD+jAZ0iva/4viTRGlfuAnHPVorr8ivnjmxY7ti7l
	EHjSOHPDHGqjV90+rjpF8RbRk5vf3RQ35FxY4GKZRQU9E3sXILYkvbfyeYt5ozvDG8BE/qT1dIHkP
	EWtWa3s4vOAAtx0Vt3ctQh6fb9pZaMNkLZ3Hbpu5kc1zuDv+4hayel5NtUbLJ0OT/Ey8kVKIAV/O/
	j18t+6yq3cL9C6MVF/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMTz-00FmeR-NJ; Tue, 07 Mar 2023 01:51:15 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMTw-00FmcF-FY
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 01:51:14 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 01C8D24E154;
	Tue,  7 Mar 2023 09:50:49 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:50:48 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:50:47 +0800
Message-ID: <b02466fa-9c9d-3d8a-9112-2b52f14460d7@starfivetech.com>
Date: Tue, 7 Mar 2023 09:50:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface
 settings
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-9-samin.guo@starfivetech.com>
 <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
 <bc79afab-17d1-8789-3325-8e6d62123dce@starfivetech.com>
 <CAJM55Z8zYUQc33r9tJB1du-FSp+uDf40720taMuGTuPcPU+aZg@mail.gmail.com>
 <52822ce5-0712-48e5-81e0-c6ac09d6a6ee@lunn.ch>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <52822ce5-0712-48e5-81e0-c6ac09d6a6ee@lunn.ch>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_175112_671930_4792CF29 
X-CRM114-Status: GOOD (  10.70  )
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

CgrlnKggMjAyMy8zLzYgMjE6MDY6MjAsIEFuZHJldyBMdW5uIOWGmemBkzoKPj4gVWdoLCB5b3Un
cmUgcmlnaHQuIEJvdGggdGhlIHN5c2NvbiBibG9jaywgdGhlIHJlZ2lzdGVyIG9mZnNldCBhbmQg
dGhlCj4+IGJpdCBwb3NpdGlvbiBpbiB0aG9zZSByZWdpc3RlcnMgYXJlIGRpZmZlcmVudCBmcm9t
IGdtYWMwIHRvIGdtYWMxLCBhbmQKPj4gc2luY2Ugd2UgbmVlZCBhIHBoYW5kbGUgdG8gdGhlIHN5
c2NvbiBibG9jayBhbnl3YXkgcGFzc2luZyB0aG9zZSB0d28KPj4gb3RoZXIgcGFyYW1ldGVycyBh
cyBhcmd1bWVudHMgaXMgcHJvYmFibHkgdGhlIG5pY2VzdCBzb2x1dGlvbi4gRm9yIHRoZQo+PiBu
ZXh0IHZlcnNpb24gSSdkIGNoYW5nZSB0aGUgMm5kIGFyZ3VtZW50IGZyb20gbWFzayB0byB0aGUg
Yml0IHBvc2l0aW9uCj4+IHRob3VnaC4gSXQgc2VlbXMgdGhlIGZpZWxkIGlzIGFsd2F5cyAzIGJp
dHMgd2lkZSBhbmQgdGhpcyBtYWtlcyBpdCBhCj4+IGxpdHRsZSBjbGVhcmVyIHRoYXQgd2UncmUg
bm90IGp1c3QgcHV0dGluZyByZWdpc3RlciB2YWx1ZXMgaW4gdGhlCj4+IGRldmljZSB0cmVlLgo+
IAo+IEkgcHJlZmVyIGJpdCBwb3NpdGlvbiBvdmVyIG1hc2suCj4gCj4gQnV0IHBsZWFzZSBmdWxs
eSBkb2N1bWVudCB0aGlzIGluIHRoZSBkZXZpY2UgdHJlZS4gVGhpcyBpcyBzb21ldGhpbmcgYQo+
IGJvYXJkIGRldmVsb3BlciBpcyBnb2luZyB0byBnZXQgd3JvbmcsIGJlY2F1c2UgdGhleSBhc3N1
bWUgTUFDIGJsb2Nrcwo+IGFyZSBpZGVudGljYWwsIGFuZCBub3JtYWxseSBuZWVkIGlkZW50aWNh
bCBjb25maWd1cmF0aW9uLgo+IAo+IEkgYXNzdW1lIHRoaXMgaXMgYWxzbyBhIGhhcmR3YXJlICdi
dWcnLCBhbmQgdGhlIG5leHQgZ2VuZXJhdGlvbiBvZiB0aGUKPiBzaWxpY29uIHdpbGwgaGF2ZSB0
aGlzIGZpeGVkPyBTbyB0aGlzIHdpbGwgZ28gYXdheT8KPiAKPiAJQW5kcmV3CgoKSGkgQW5kcmV3
LCBZZXMsIHRoZSBoYXJkd2FyZSBkZXNpZ24gZG9lcyBub3QgdGFrZSBpbnRvIGFjY291bnQgdGhl
IGZlYXNpYmlsaXR5IG9mIHRoZSBzb2Z0d2FyZS4KVGhlIG5leHQgdmVyc2lvbiB3aWxsIGJlIGZp
eGVkLiBUaGFuayB5b3UuIApJIHdpbGwgdXNlIGJpdCBwb3NpdGlvbiBpbnN0ZWFkIG9mIG1hc2ss
IHdoaWNoIGlzIGRlc2NyaWJlZCBpbiBkZXRhaWwgaW4gdGhlIGRvY3VtZW50LgoKQmVzdCByZWdh
cmRzLApTYW1pbgoKLS0gCkJlc3QgcmVnYXJkcywKU2FtaW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
