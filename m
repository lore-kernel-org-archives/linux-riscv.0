Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5EAC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:In-Reply-To:Mime-Version:
	Message-Id:Date:References:Subject:Cc:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbY2VitGB9zuM5TV8f2G15oZL56J86teqoOl9JPQcXI=; b=4pBRti3oKFNoD2
	Ryl1DGj1GQn8uPPHIXMdklItiOBUnbPkpHbEX1bFzaAO01l19n7kEwy0FHpHBDeR+gfeXBUPxyHh3
	K7bdIO8Eb0vu6pVDTvo0OnmD5gcAt/6f2Q7/xX9a76F1B6+6FPo7+G6eYTEjp6UApR46bmeKksURh
	3+8+W4Tp1Ei1Trkej9DU+yax6cze4Jh+Yk2qYS0JnhGJ6AasQ1WeP5kEFDZ802/QUV+/lWOQbt2pE
	NUbhQ5Semapy/Om0Hyi1oN1+F/g2+ftyHmVd3VHbXZ1zja9UYurmEpANkysaluZebApl7TniXnZnX
	3r9ijTa1pKuIp9tLpflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tlc-000000071SG-3lK2;
	Wed, 09 Apr 2025 11:38:52 +0000
Received: from sg-1-23.ptr.blmpb.com ([118.26.132.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TlZ-000000071RQ-3WZ2
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 11:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1744198718; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Oe8aDUQAq4T02rUk+a7NU/+Tifl5LtSGzTZvSbTGRuU=;
 b=rKkxpWV+4D0TrxLogpHta3M/JVPt7Cr7OYljS1tbl+Gz412K2g77vJZ2AhL3ZpYkWO1elf
 o2NrMXe1gpv90LVcffYr+IUGyGYIsJmRpUZknrAuJpeUsz8kV6teegpnDh4ubLFHEi3Kdm
 wcW7+X0nMxrkDzxgu+85UtbgIC1RiTTop2mLtsr9QeHdiRBfoymLuxoL0o8qI/ILkkWaGq
 VgUpN4PmEmXoVNStq941sVBQ6VZMmXVclMVijMRqW9Zhy5BhrZhiWif8jKFU0Id3wS5tKK
 Iq11FOZmcB1/yPkzRNzADNE0encJIQn7Kk/4AtRdpy/A+eaIeTNA+F6UdLyiAg==
Cc: "Vinod Koul" <vkoul@kernel.org>, 
	"Kishon Vijay Abraham I" <kishon@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, 
	"Ze Huang" <huangze@whut.edu.cn>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Thinh Nguyen" <Thinh.Nguyen@synopsys.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
	<20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
Date: Wed, 09 Apr 2025 19:38:35 +0800
Message-Id: <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
Mime-Version: 1.0
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
X-Lms-Return-Path: <lba+167f65c3c+2360e3+lists.infradead.org+junzhong.pan@spacemit.com>
To: "Ze Huang" <huangze@whut.edu.cn>
From: "Pan Junzhong" <junzhong.pan@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_043850_268024_2BF0B5AD 
X-CRM114-Status: UNSURE (   4.24  )
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

SGkgWmUsCgo+ICtzdGF0aWMgaW50IHNwYWNlbWl0X2NvbWJwaHlfaW5pdF91c2Ioc3RydWN0IHNw
YWNlbWl0X2NvbWJwaHlfcHJpdiAqcHJpdikKClRoZSBVU0IzIHBoeSBkcml2ZXIgaXMgdXBkYXRl
ZCBpbiB0aGUgdmVuZG9yJ3MgdHJlZS7CoApodHRwczovL2dpdGVlLmNvbS9iaWFuYnUtbGludXgv
bGludXgtNi42L2NvbW1pdC8xYzBiM2I0YjljNzdkMjJjYTg4NmM4YTRjNDRlNjJiNTg5MWY4YWJj
CgpZb3UgY2FuIHN1Ym1pdCB2MiB0b2dldGhlciB3aXRoIHRoZSBjaGFuZ2Ugb2YgbGZwc190aHJl
cyAod3JpdGVzIDB4NTggcmVnaXN0ZXIpCndpdGhvdXQgYWRkaW5nIG5ldyBwcm9wZXJ0aWVzIGZv
ciBkdCBub2RlLgoKQi5SLgoNCgpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGFyZSBj
b25maWRlbnRpYWwgYW5kIG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQg
ZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBtZXNzYWdlLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNobWVudCBmcm9tIHlv
dXIgc3lzdGVtIGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1h
aWwuIFVuaW50ZW5kZWQgcmVjaXBpZW50cyBzaG91bGQgbm90IHVzZSwgY29weSwgZGlzY2xvc2Ug
b3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZS4gRW1haWxzIGNhbm5vdCBiZSBndWFyYW50ZWVk
IHRvIGJlIHNlY3VyZSBvciBlcnJvciBmcmVlIGFzIHRoZXkgY2FuIGJlIGludGVyY2VwdGVkLCBh
bWVuZGVkLCBsb3N0IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBzaG91bGQgdGFrZSBmdWxsIHJlc3Bv
bnNpYmlsaXR5IGZvciBzZWN1cml0eSBjaGVja2luZy4gCiAK5pys6YKu5Lu25Y+K5YW25Lu75L2V
6ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN
5YWB6K646KKr5oqr6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu2
77yM5pWs6K+356uL5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu255qE5pa55byP6YCa55+l5Y+R5Lu2
5Lq677yM5bm25bCG5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit
5LqI5Lul5Yig6Zmk44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq6
77yM5pWs6K+35YiH5Yu/5L2/55So44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu7
5L2V5YaF5a6577yM5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a656ICM
6YeH5Y+W5Lu75L2V6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B5piv5LiA56eN5a6J
5YWo5ZKM5LiN5Lya5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa5L+h5pa55byP77yM5Y+v6IO95Lya
6KKr5oum5oiq44CB5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM
6LSf6LSj5YGa5aW95a6J5YWo5qOA5p+l44CCCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
