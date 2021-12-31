Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Dec 2021 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6psSrWw3hH/4kZJ9VVQPEbmhfG/FsD+S/PoW6/FJbJw=; b=YlS72qJAQsD3SB2O2NCBa6LMa1
	8bXIMKMszG96p0yInzv8OHtdn1bOPCpmLTxxhuH3N57QjrAInlkJihI7vPSCRaHS2erchFmk/Myy7
	lq2/3di4QUv5G4wf3mGf1y3bX/rphRcmwHHfm8iD1kf+Hs5LDpv9nIT6tnghleQ6Ty3VROuI51uea
	/MaPtOtNP8BrjhDSlq17yQZ91zvChqBz98Fhu2D1V1AN1N9yLu6rJUcgRGSbLj68yEC3B3WkwPGeC
	8EsTBOoGrOzPP1mQ+dGGFdtoV9L08dW/WingWz07epTi94rE4jv2rQ2C73yjaKe7viuCSSHmH6O8y
	n4qPeQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3JwG-006E0h-Tm; Fri, 31 Dec 2021 15:35:28 +0000
Received: from resqmta-c1p-023464.sys.comcast.net ([2001:558:fd00:56::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3JwE-006E0G-HP
 for linux-riscv@lists.infradead.org; Fri, 31 Dec 2021 15:35:27 +0000
Received: from resomta-c1p-023266.sys.comcast.net ([96.102.18.234])
 by resqmta-c1p-023464.sys.comcast.net with ESMTP
 id 3IdUntOrKjsNg3Jw8ncfGZ; Fri, 31 Dec 2021 15:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1640964920;
 bh=X0PGbkm5AYY94s+W5+NodReCIEluZYxv8imWvsSK3Yg=;
 h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
 Content-Type;
 b=zDqg6Tb9sclnQpBV3FdaFBbsTqX35htzY4F6j0fy3JkbNCMhwbfanQ9m4BWjcjMzH
 UsxP94BgAjQ+tDZWpoUQ7r6nw6tY+TceacQUI0Ds/o1o2+HoouLTDP3J3PGkI3pPop
 CY7ssdLTJp6ECBb2u34kzxtyxlNzTJWnWL50MYTueOQPXWBKKAPiHDKKWaj6jF9nXD
 44GjFsYA/cBbw447y5IGYjH5VdTH2Qh+20gWbLnV1v1yKznJdKt0+lIbhJuEn5wXL7
 rIgiNrt4QjfCTr+hZrlj5Is/sOJUZg49xtTa6dBoOmRCMymMLGVHFXvAW5cKQCu0kA
 jVYDc+y877uqw==
Received: from [IPv6:2601:647:4700:284:9d56:573c:4e75:fa6c]
 ([IPv6:2601:647:4700:284:9d56:573c:4e75:fa6c])
 by resomta-c1p-023266.sys.comcast.net with ESMTPSA
 id 3Jw2nnMYa4rcW3Jw3nrhvk; Fri, 31 Dec 2021 15:35:17 +0000
X-Xfinity-VMeta: sc=-100.00;st=legit
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Add gpio poweroff
To: James Clarke <jrtc27@jrtc27.com>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211231061110.89403-1-w6rz@comcast.net>
 <73F7FAE3-5113-48DD-B0F5-0EEAA0A8B0C1@jrtc27.com>
From: Ron Economos <w6rz@comcast.net>
Message-ID: <99ac0009-b49a-f618-1b96-7896d6d155ae@comcast.net>
Date: Fri, 31 Dec 2021 07:35:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73F7FAE3-5113-48DD-B0F5-0EEAA0A8B0C1@jrtc27.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_073526_659540_86F07C74 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMzAvMjEgMTA6NTggUE0sIEphbWVzIENsYXJrZSB3cm90ZToKPiBPbiAzMSBEZWMgMjAy
MSwgYXQgMDY6MTEsIFJvbiBFY29ub21vcyA8dzZyekBjb21jYXN0Lm5ldD4gd3JvdGU6Cj4+IFRo
aXMgcGF0Y2ggaXMgcmVxdWlyZWQgZm9yIHRoZSBmb2xsb3dpbmcgY29tbWl0IHRvIHdvcmsuCj4+
Cj4+IGNvbW1pdCBmMjkyOGUyMjRkODUgKCJyaXNjdjogc2V0IGRlZmF1bHQgcG1fcG93ZXJfb2Zm
IHRvIE5VTEwiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb24gRWNvbm9tb3MgPHc2cnpAY29tY2Fz
dC5uZXQ+Cj4+IC0tLQo+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRj
aGVkLWEwMC5kdHMgfCA1ICsrKysrCj4+IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1h
dGNoZWQtYTAwLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNo
ZWQtYTAwLmR0cwo+PiBpbmRleCA2YmZhMWYyNGQzZGUuLmM0ZWQ5ZWZkZmYwMyAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRz
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAw
LmR0cwo+PiBAQCAtMzksNiArMzksMTEgQEAgcnRjY2xrOiBydGNjbGsgewo+PiAgICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDxSVENDTEtfRlJFUT47Cj4+ICAgICAgICAgY2xvY2stb3V0cHV0LW5h
bWVzID0gInJ0Y2NsayI7Cj4+ICAgICB9Owo+PiArCj4+ICsgICAgZ3Bpby1wb3dlcm9mZiB7Cj4+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1wb3dlcm9mZiI7Cj4+ICsgICAgICAgIGdwaW9z
ID0gPCZncGlvIDIgR1BJT19BQ1RJVkVfTE9XPjsKPj4gKyAgICB9Owo+IFdoeT8gSXTigJlzIGFi
c3RyYWN0ZWQgYnkgZmlybXdhcmUsIHdoaWNoIHdvcmtzLgo+Cj4gSmVzcwo+CkkgZGlkbid0IHJl
YWxpemUgdGhhdCBPcGVuU0JJIDEuMCBoYWQgYmVlbiByZWxlYXNlZCBsYXN0IHdlZWsuIFBsZWFz
ZSAKZGlzcmVnYXJkIHRoaXMgcGF0Y2guCgpSb24KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
