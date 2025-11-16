Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDBCCD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YknnOzaT1X6qVS81QsRpIFotKJp9QE9pGEPWGHSobrc=; b=arNMEhWYPzMbUt
	cRe7LAj1AlERw0ukkVYRrILLvDdtQJEdfjPp77ew8srENcET6HN6litBeZ+kUmGkM7Rzl/RW6MIKN
	cDmr22q2gUtZf9LgVKuGSluOAQhAekKKjHEfZd8WdC94IFIRh63KlrYGn8mwHD5bAbbr7TnWdh8O7
	8g7zz5nEleXmc9DqwKDFCN+t6VVcagjb7Ql8eVo/tw5M3UGm24lx+g20cme+Y5neEtRrdrqjBUFoX
	HqxtQv9e0c9jOvmilWq46CcHJpEnQRgiDFludw8GXFHBGuoAtAL6xFhEuPrK2SYYZsQO+W+Z43tc0
	vTetFEp/eU2lw7P7QJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdmr-0000000EjyT-1LPu;
	Sun, 16 Nov 2025 14:31:29 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdmo-0000000EjxZ-229u;
	Sun, 16 Nov 2025 14:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
	:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RtM/3wlSoxI/e3SQ7Nc7cqjCZdAS9xVLSw+dgZ63xFk=; b=ts2dZh9yV/CCBxXrnSzIaDSTeT
	BXzP6mbsR7/lHtQ9872MT4NqQRqg85y14woN9wgNeycJRUKSWcqFprwgvCtBPiCEG3LRYX0hQ+CYx
	L3yMaS3S8wSz1U+mk8G1YytdS7BUrarUpaO6ChSZaBumHK1122j6j0jJJmMi5ieM1GpsE7EJXn3Ru
	bd3ykABRJUot78F6OtRIheh1/FWXWVpF6znAjph6bgu1s/pzgtVzmlkLd2HBqri6SQRxVVVlqzZYY
	esZJS5x2UVuBqo7caxbTyGUXOeZp9sqkj///b7Cd9BcYJBeHImIzTzOiDiZ33ugr3vwjws2WtD5rf
	ID4dbZoQ==;
Received: from d100-116.icpnet.pl ([77.65.100.116] helo=[192.168.0.120])
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKdmh-0000000FZTD-3tER;
	Sun, 16 Nov 2025 15:31:19 +0100
Message-ID: <7ff30ae9-e4c0-47ae-80ad-726eaa557fd0@szczodrzynski.pl>
Date: Sun, 16 Nov 2025 15:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: wens@csie.org
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 parthiban@linumiz.com, paulk@sys-base.io
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 xsFNBGP/IeYBEACQ4t0Jxme3IIuQ94IP4xWSl2JEH/4MZYQEOCHiJ5iKAn+V6nESbnWAU50d
 f/8uI84s2i1OUqbq5W1sZQEITpkO/CNqMPY+Q2WUxa0ezYvGOfN0o6Ig0YECn8XFR0rIvFpj
 MS3IvH56bi+3aiX8ArDOzJ5U5yZfj6TJvX8kQRDAqNPDjdboB7ZggFVvd3OJLZwkwW9oSHSh
 s9z662E152GSrBW9YUxWVPJW6QDqKuD8I52uV+HkvJmJblSm+BQbtfE/xTVWXKh1hRVQx5r4
 YjjqT/z2uPJZ3eJWmOBEGMG4dj2mTQ3zxuHuyAWoY5cFFLUipUiTeIRHW0vUQpGYRKra7qic
 nsIo3nph/Q3m/f1E3Yb0GLYlX6fk0OwHwoucHvXr+zptG54FswVZZZ1fdqDAdA86raQLrb44
 rfYqw6CbeXyGe6Bm6/CUDRugbjdJShSILuyTudos3tiKGYs3uL7Hc54FIfOHOq7aCgu23VzW
 cj8n0VmMFtHCUdPaL0qPs1un/hBXjKRwuMZ0PSQ5QpyvyUuSP7w/8pe33B2vGpTkDqhjEGam
 OYWw81ztQl2UE0sFz8vZo6Z26c7eXNNSpHKfGr2MURmPoxF4NMTuKJ1OHBqHMZ8qOGcnkZjE
 uwc9SXoXvP1SX0g1p6Q3cbu2ECJjqsqzjMfml6D7HFblCKuPnwARAQABzStLdWJhIFN6Y3pv
 ZHJ6ecWEc2tpIDxrdWJhQHN6Y3pvZHJ6eW5za2kucGw+wsGRBBMBCAA7AhsDBQsJCAcCBhUK
 CQgLAgQWAgMBAh4BAheAFiEEqHS2JG0jlU9QbMYMQwN6xipgBWIFAmXE7R4CGQEACgkQQwN6
 xipgBWLWpw//dK4WQUGpOAQyGPpqzIfZ+krCh4hzqWnjwEJNEi2F75f0tDIluotJEYSVhheR
 nhqoZsxQ/En7SegfzN0RLsdxs9ZQQ8ZYVjhrOrVU8M1j6TvbMbLtqAGgnPuiuY0B/GMdGpme
 u7BGBvN8Y87yPyRXBKGPWhSPWlKgZKzjE+Eo6e6kPQpgen27h9wv+ICspbARZQdiTNIi7WsW
 CJDtuMfLksnC5kJQ2hrt+WV2l4iLW4L0X2L0pjWzwCyd/TEA2dcfujhjf3RaXINydMLgjjuD
 J/97GkCPGRNIfh2b+guAyul7NlidqSYgGCZNZfjoj1F6nuzoQML31A2VwGUK8iAFCj5OZBDg
 YdlYHDobZMxxmyV32qgWDBHlhytvLi6zBS28CWxfb7NvLNBHGz61ih5s/dmg1HtloLgfoy7S
 zp02sl4Pu0/UOn3AydZHXHRrANwagXI/RvWRsvE7bdV2nTxpLBvDebQZ+vh+LvQT8NeSy7qF
 oTfDBiPHcAKBciC2aPJ6HLSXiPbri57Ory/NGe3H2aUsvMcLPTbpiNO5wTMBCK7peiBbe4S4
 947ND9rH2S2ScUeqtg18rEzpyLopieZuzRPYWWmn09m/1uwiMYTNvqOnzzqDiWNK3yT9jGSt
 wPNTIso+r+JXa0jX1R3An5k+QKzoKPRUoFacLqkpp1j4aYfOwU0EY/8h5gEQAL2vqV4Psasp
 NbkCdbaA9MPUGpRNEMExfNR3dDc67/ORzaTJ8BLikYDIW/xO1qpXhZLFOcEvVvxKW79Vc8Rf
 fAprxdK3sXqH6SWlwM1o01j2ndQVspdyr3b79qgakXQBYNG+ThJ8HWiGEADWxtVDKfua1HX7
 B8y3f1yiK7i1QcmbOWjQ5rxwLV2lWE5cL1fxRQKoLl6tSXs593EX1MzTO7MVmqSjrMm3ZNmm
 xBbtXANBPfwaBo3adsmz233aV4SqazUxlLLzfSGrLA6tK9idriu4V4Xdb8qycyYjXZO186uv
 0uyxmkrQCnLA9RqRFPpGQGKorlxlg9t62h9N445euJN6guqsHXrh7YvGF/PDfh43FP0Ja4eN
 1Hem9dvc/ucE6qCOWb+dVqtspJAhveiRuPyXq6VyuNHTDeGhSUvj6Q+p5irft+E3+MwxCV0w
 W6mflIOCC0yiq8FTyNsKTytwVN9wNcIWbq6dIGPvYJ94hN7c0+sMpWtEjrBtMU684lDoFHUs
 Z5zgbgwhYCEe2c32phCNxqTpdKy1PhQ0sxsmJ52P043BfgsGkxxzGaL0Jo+QRCK9FanfAS92
 yhDc//4UdwsvYp4DdauznyQO9NclHlAbvWS6pXMRkWRbx2mcM5g8ctYtwI1leHTBqM3kbfil
 tq29p5V9hzC6pWSuS2PADbN3ABEBAAHCwXYEGAEIACAWIQSodLYkbSOVT1BsxgxDA3rGKmAF
 YgUCY/8h5gIbDAAKCRBDA3rGKmAFYr8ND/9bCpOQezRNxquNK3R5aielQlzotM8xAf5Bq2V4
 OsnDac/umwXynI8pfblPhswd8/in80hgRWgqpbjRelLz54efnB2lpyf1CmXhDQAHwdfy0pVs
 IALLQ6bW0ehZ6VIqps3lgGORurHFSCU18tojWz/w2X/tyZ9QKuR8YoW6NsGJiWy8gn56NQC/
 w+Kjl1+hQum284+fyWbEmkDMbsgP+bffEdrP0VVltfKGpd1WP9IinGzdsyCU/wzdYywrqdvd
 5BSxtfOesHJpyDCEAxQ4VMbjEXfEmK4ePmbT8VIJxFFS5odTTlagesXykKxQcbuiFap+wxHD
 XZ1xNm/GJR/Z0mMt1km+s4JDAVhFnZNWVHvKCp0+lSaKj0DPaPZXWnaoQ8u69Hsih/0m2pP4
 mnZ4NvAqo14vzJZYJP8ZWN+24OV5mILZRu4mxkdwUIg2lQxwtMT7rQA4vIZf8hbXK9vFyY9L
 uN5FC6oWjckq32glQpT73Eh7VV5pjcmJUZxFQkd7IO+E6sGryuC8rF2+X3pkFI8G+N+Otqy8
 YupG5oOThTzwcFRAYQ97Pi/hcbVP6nUyqVZyHP9rFoT+rRCZ51iUIKnRO96mgj0ipANzmcbR
 vg8LAbAHCFI3ZiKYB9fvIwuPhaamu0rewMtVbZiGqVNHTs0ly+Bk8Vj+3Tc5jF7xTh5MCQ==
In-Reply-To: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_063126_688826_258A065B 
X-CRM114-Status: GOOD (  19.76  )
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

VyBkbml1IDIwMjUtMTEtMTYgb8KgMTU6MDM6MTgsIENoZW4tWXUgVHNhaSBwaXN6ZToKCj4gT24g
U3VuLCBOb3YgMTYsIDIwMjUgYXQgOTo0NuKAr1BNIEt1YmEgU3pjem9kcnp5xYRza2kKPiA8a3Vi
YUBzemN6b2Ryenluc2tpLnBsPiB3cm90ZToKPj4gW3JlcGx5aW5nIHRvIHYxIHRvIGtlZXAgdGhl
IHNhbWUgc2VyaWVzIG9uIFBhdGNod29ya10KPiBUaGF0IGlzIG5vdCB0aGUgcmlnaHQgd2F5IHRv
IGRvIGl0Lgo+Cj4gSWYgeW91IHJlcGx5IHRvIGFuIG9sZCBzZXJpZXMsIHRoZSB0b29saW5nIGRv
ZXMgbm90IHBpY2t1cCB0aGUgbmV3IHZlcnNpb24KPiBhcyBhIHNlcGFyYXRlIHNlcmllcy4KPgo+
IENoZW5ZdQoKSGksCgpJIG5vdGljZWQgdGhhdCBpdCBpbmRlZWQgZGlkbid0IHdvcmsuIEhvd2V2
ZXIsIFBhdGNod29yayBkaWRuJ3QgcGljayB1cCB0aGUgdjIgY292ZXIgbGV0dGVyIGF0IGFsbCwg
c28gSSB0aG91Z2h0IHJlcGx5aW5nIHRvIHYyIHdvdWxkIG1lc3MgdXAgdGhlIHRocmVhZCBldmVu
IG1vcmUuCgpUaGF0IGJlaW5nIHNhaWQsIHRoZSB2MyBjb3ZlciBsZXR0ZXIgaXMgbm90IHZpc2li
bGUgdGhlcmUgZWl0aGVyLgoKU2hvdWxkIEkgcmVzZW5kIHRoaXMgYXMgdjQgW3doaWNoIG1lc3Nh
Z2UgdG8gcmVwbHkgdG8/XSBvciBzZW5kIGEgY29tcGxldGVseSBuZXcgc2VyaWVzIHBlcmhhcHM/
CgpJIGFwb2xvZ2l6ZSBmb3IgdGhlIGNvbmZ1c2lvbiwgdGhpcyBpcyBteSBmaXJzdCB0aW1lIGRv
aW5nIHRoYXQuCgpSZWdhcmRzCkt1YmEKCj4+IFNvbWUgQWxsd2lubmVyIGNoaXBzIChub3RhYmx5
IHRoZSBEMXMvVDExMyBhbmQgdGhlIEExMDApIGhhdmUgYSAiY29tYm8KPj4gTUlQSSBEU0kgRC1Q
SFkiIHdoaWNoIGlzIHJlcXVpcmVkIHdoZW4gdXNpbmcgc2luZ2xlLWxpbmsgTFZEUzAuIFRoZSBz
YW1lCj4+IFBEMC4uUEQ5IHBpbnMgYXJlIHVzZWQgZm9yIGVpdGhlciBEU0kgb3IgTFZEUy4KPj4K
Pj4gT3RoZXIgdGhhbiBoYXZpbmcgdG8gdXNlIHRoZSBjb21ibyBELVBIWSwgTFZEUyBvdXRwdXQg
aXMgY29uZmlndXJlZCBpbgo+PiB0aGUgc2FtZSB3YXkgYXMgb24gb2xkZXIgY2hpcHMuCj4+Cj4+
IFRoaXMgc2VyaWVzIGVuYWJsZXMgdGhlIHN1bjZpIE1JUEkgRC1QSFkgdG8gYWxzbyB3b3JrIGlu
IExWRFMgbW9kZS4gSXQKPj4gaXMgdGhlbiBjb25maWd1cmVkIGJ5IHRoZSBMQ0QgVENPTiwgd2hp
Y2ggYWxsb3dzIGNvbm5lY3RpbmcgYQo+PiBzaW5nbGUtbGluayBMVkRTIGRpc3BsYXkgcGFuZWwu
Cj4+Cj4+IENoYW5nZXMgaW4gdjIvdjM6Cj4+IC0gQXBwbGllZCBjb2RlIGZvcm1hdHRpbmcgY2hh
bmdlcyBmcm9tIHJldmlldyBjb21tZW50cwo+PiAtIENoYW5nZWQgImRwaHkiIHRvICJjb21iby1w
aHkiCj4+IC0gTWFkZSB0aGUgTFZEUyBzZXR1cC90ZWFyZG93biBmdW5jdGlvbnMgYWJvcnQgZWFy
bHkgaW4gY2FzZSBvZiBlcnJvcgo+PiAgICAoYWRkaW5nIGEgcHJvcGVyIHJldHVybiB2YWx1ZSB3
b3VsZCByZXF1aXJlIGNoYW5nZXMgaW4gc2V2ZXJhbCBsZXZlbHMKPj4gICAgIG9mIGNhbGxlciBm
dW5jdGlvbnM7IHBlcmhhcHMgY291bGQgYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoKQo+PiAt
IEFkZGVkIHRoZSBQSFkgcHJvcGVydGllcyB0byBEVCBiaW5kaW5ncwo+PiAtIFJlbmFtZWQgbHZk
czBfcGlucyB0byBsY2RfbHZkczBfcGlucwo+PiAtIFJlYmFzZWQgb24gdG9wIG9mIGRybS9taXNj
L2tlcm5lbC9mb3ItbGludXgtbmV4dAo+PiAtIEhvcGVmdWxseSBjb3JyZWN0ZWQgdGhlIGluY29t
cGxldGUgcGF0Y2ggbGlzdCBvZiB2Miwgd2hpY2ggaGFwcGVuZWQKPj4gICAgZHVlIHRvIGFuIFNN
VFAgZXJyb3IKPj4KPj4gS3ViYSBTemN6b2RyennFhHNraSAoNik6Cj4+ICAgIHBoeTogYWxsd2lu
bmVyOiBwaHktc3VuNmktbWlwaS1kcGh5OiBTdXBwb3J0IExWRFMgaW4gY29tYm8gRC1QSFkKPj4g
ICAgZHJtL3N1bjRpOiBTdXBwb3J0IExWRFMgdXNpbmcgTUlQSSBEU0kgY29tYm8gRC1QSFkKPj4g
ICAgZHJtL3N1bjRpOiBFbmFibGUgTFZEUyBvdXRwdXQgb24gc3VuMjBpIEQxcy9UMTEzCj4+ICAg
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdW40aTogQWRkIEQxcy9UMTEzIGNvbWJvIEQtUEhZIGJp
bmRpbmdzCj4+ICAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDFzLXQxMTM6IEFkZCBELVBIWSB0
byBUQ09OIExDRDAKPj4gICAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBkMXMtdDExMzogQWRkIExW
RFMwIHBpbnMKPj4KPj4gICAuLi4vZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFt
bCAgICAgfCAgNiArKwo+PiAgIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMu
ZHRzaSAgICB8IDExICsrKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMg
ICAgICAgICAgICB8IDUwICsrKysrKysrKysrKysKPj4gICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdGNvbi5oICAgICAgICAgICAgfCAgNiArKwo+PiAgIGRyaXZlcnMvcGh5L2FsbHdpbm5l
ci9waHktc3VuNmktbWlwaS1kcGh5LmMgICB8IDcwICsrKysrKysrKysrKysrKysrKy0KPj4gICA1
IGZpbGVzIGNoYW5nZWQsIDE0MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiAt
LQo+PiAyLjI1LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
