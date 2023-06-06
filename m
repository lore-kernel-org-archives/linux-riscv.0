Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A4C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 02:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxMw6GMCPI+Y+S9q5bDoEtzLlb95l8wCPN90zZKrNoI=; b=X9TCHEgUHEKTIX
	pL+Dhr6vHPwlfQcmn5NQFC6KwBEO2PyZgJIwQnolwmdE3QBpTJl6StRydAobionvO3Pdyd71HygWA
	bvXytyePL/CVKyBJn03GslnjSpm/2EbzKJtVfMO7xnQGtp2HBvtM0+Twtr4S/CR7NTD7hO2Lwbrdx
	VKBwf1frCvWROjyjdpvtBECy2e2Vz0Z6OdnSaKthzYE50KgtxoJsxganXbbU7POYvX/5c1wswfkYj
	6Ch3d+RdjRVb/U53i08oiRRgT0poE3BzXnian7TZ5XF5xao9F/FKEFGrVacSlVfk5C2Z63fv5eEHj
	tyeT3D9fNIJ8Mp5F0TUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6MS3-00HRnP-2o;
	Tue, 06 Jun 2023 02:29:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6MS0-00HRle-1R
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 02:29:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso56320245e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 19:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1686018573; x=1688610573;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g/FdJBLdOP0pOmxgTepe2Yp+gpwhSq7jwb8omte010=;
        b=UBBO/4aM/KMru++iKT55ZQfPoQsC/BlYty7h3a/cohOGxLnFb/iY7ghjuam6UGH5i8
         YZOM5JueTgzYVviRHcu/wdMF//xicsqTau3mWxBHXcXY8fxy32bG8qwjnNx4OQYPgYuI
         EIKY9nhrzh6g8Elb3Ho8hnVUBcTjDvp8jO8CeHa+YF1VJ25GfJ2NYXQ+Gy+rnUb0FeO+
         Hk5Fm+AwY8TOwkaPLTzLskY6Eg9XKVmeaQk8iNWU+yfXIiMNzcvdyszLKdSyhS93S4Kh
         ngbDnDBRyXzaiMWEKhfq9jrS4UAJtXinoDxfo+Z3PrQINut/2bo1zDb5zFMJTUHdmWhN
         9AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686018573; x=1688610573;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g/FdJBLdOP0pOmxgTepe2Yp+gpwhSq7jwb8omte010=;
        b=dPssSFhSER9G47krVBl8csF5htGAhOZLpnDRI2kjda16uvpugzCbniTTVw+mDXWZh9
         1FYwiFFsJ+UjCgtc1CHUO8kiHBtiy0o8F/Lc4EvGWnxFUYnSDkoQ/hlAsZb8R81dn5YS
         fBqdpD9z81EEGk2ulJudQem6Z5HlautRfmosjWX52mBZkEAyEYVMusxIjSiTYJp96Oy3
         H+L4mAEHMZyuK/uc8laCxOEjBjU+ygZ6KJmM9jtH7fJjapOWV0eiCrVsqG4kDDo/sXtV
         IzJX9cf6GuDodHUpDnwYT/cJoJ8x6wNevjfWewlpK7/BD9mosDoSLL1rHO6sj8dCmWmb
         uQPQ==
X-Gm-Message-State: AC+VfDxpRBeSTeq05eOEAgRqzmCHjMsKV54M0OAciVwBmuhHDBsd8GuE
	rrRnQ9aqrgWnWkse5PKFTS4G5w==
X-Google-Smtp-Source: ACHHUZ4qMlTfTgFKvzX8FyM5ziJHbf7PlEfnzCjKkdRFFcomXTgM+XMluDMyU0RUZAPrRc3oEGXNmg==
X-Received: by 2002:a05:600c:202:b0:3f6:1474:905 with SMTP id 2-20020a05600c020200b003f614740905mr899252wmi.29.1686018573420;
        Mon, 05 Jun 2023 19:29:33 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f42a75ac2asm12411250wml.23.2023.06.05.19.29.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jun 2023 19:29:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: Bug report: kernel paniced while booting
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <bbc2d1d2e32587c4e212965dab9480b6790f1d37.camel@icenowy.me>
Date: Tue, 6 Jun 2023 03:29:22 +0100
Message-Id: <5D78F9B5-FA9F-41A7-9840-733DE07B5F7E@jrtc27.com>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
 <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
 <ZH37WMnx/rYSRF/o@sunil-laptop>
 <CAOnJCU+v-tinJb3=FY9GKzR=CGc+AE45wVdpVVZLSG1WOR2PLA@mail.gmail.com>
 <bbc2d1d2e32587c4e212965dab9480b6790f1d37.camel@icenowy.me>
To: Icenowy Zheng <uwu@icenowy.me>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_192936_521501_99FDA581 
X-CRM114-Status: GOOD (  31.56  )
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
Cc: robh <robh@kernel.org>, "mason.huo" <mason.huo@starfivetech.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, "jeeheng.sia" <jeeheng.sia@starfivetech.com>, anup <anup@brainfault.org>, "paul.walmsley" <paul.walmsley@sifive.com>, "conor.dooley" <conor.dooley@microchip.com>, palmer <palmer@rivosinc.com>, linux-kernel <linux-kernel@vger.kernel.org>, "leyfoon.tan" <leyfoon.tan@starfivetech.com>, Song Shuai <songshuaishuai@tinylab.org>, guoren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv <linux-riscv@lists.infradead.org>, ajones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNiBKdW4gMjAyMywgYXQgMDE6NDgsIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPiB3
cm90ZToKPiAKPiDlnKggMjAyMy0wNi0wNeaYn+acn+S4gOeahCAxMzo1NSAtMDcwMO+8jEF0aXNo
IFBhdHJh5YaZ6YGT77yaCj4+IE9uIE1vbiwgSnVuIDUsIDIwMjMgYXQgODoxM+KAr0FNIFN1bmls
IFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+PiB3cm90ZToKPj4+IAo+Pj4gT24gTW9u
LCBKdW4gMDUsIDIwMjMgYXQgMDQ6MjU6MDZQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3Rl
Ogo+Pj4+IEhpIFNvbmcsCj4+Pj4gCj4+Pj4gT24gTW9uLCBKdW4gNSwgMjAyMyBhdCAxMjo1MuKA
r1BNIFNvbmcgU2h1YWkKPj4+PiA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+IHdyb3RlOgo+
Pj4+PiAKPj4+Pj4gRGVzY3JpcHRpb24gb2YgcHJvYmxlbToKPj4+Pj4gCj4+Pj4+IEJvb3Rpbmcg
TGludXggV2l0aCBSaXNjVlZpcnRRZW11IGVkazIgZmlybXdhcmUsIGEgU3RvcmUvQU1PCj4+Pj4+
IHBhZ2UgZmF1bHQgd2FzIHRyYXBwZWQgdG8gdHJpZ2dlciBhIGtlcm5lbCBwYW5pYy4KPj4+Pj4g
VGhlIGVudGlyZSBsb2cgaGFzIGJlZW4gcG9zdGVkIGF0IHRoaXMgbGluayA6Cj4+Pj4+IGh0dHBz
Oi8vdGVybWJpbi5jb20vbmdhNC4KPj4+Pj4gCj4+Pj4+IFlvdSBjYW4gcmVwcm9kdWNlIGl0IHdp
dGggdGhlIGZvbGxvd2luZyBzdGVwIDoKPj4+Pj4gCj4+Pj4+IDEuIHByZXBhcmUgdGhlIGVudmly
b25tZW50IHdpdGgKPj4+Pj4gICAgLSBRZW11LXZpcnQ6ICB2OC4wLjAgKHdpdGggT3BlblNiaSB2
MS4yKQo+Pj4+PiAgICAtIGVkazIgOiBhdCBjb21taXQgKDJiYzg1NDU4ODMgIlVlZmlDcHVQa2cv
Q3B1UGFnZVRhYmxlTGliOgo+Pj4+PiBSZWR1Y2UgdGhlIG51bWJlciBvZiByYW5kb20gdGVzdHMi
KQo+Pj4+PiAgICAtIExpbnV4IDogdjYuNC1yYzEgYW5kIGxhdGVyIHZlcnNpb24KPj4+Pj4gCj4+
Pj4+IDIuIHN0YXJ0IHRoZSBRZW11IHZpcnQgYm9hcmQKPj4+Pj4gCj4+Pj4+IGBgYHNoCj4+Pj4+
ICQgY2F0IH4vOF9yaXNjdi9zdGFydF9sYXRlc3Quc2gKPj4+Pj4gIyEvYmluL2Jhc2gKPj4+Pj4g
L2hvbWUvc29uZy84X3Jpc2N2LzNfYWNwaS9xZW11L29vby91c3IvbG9jYWwvYmluL3FlbXUtc3lz
dGVtLQo+Pj4+PiByaXNjdjY0IFwKPj4+Pj4gICAgICAgICAtcyAtbm9ncmFwaGljIC1kcml2ZQo+
Pj4+PiBmaWxlPS9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkvQnVpbGRfdmlydC9SaXNjVlZpcnRR
ZW11L1JFTEVBU0UKPj4+Pj4gX0dDQzUvRlYvUklTQ1ZfVklSVC5mZCxpZj1wZmxhc2gsZm9ybWF0
PXJhdyx1bml0PTEgXAo+Pj4+PiAgICAgICAgIC1tYWNoaW5lIHZpcnQsYWNwaT1vZmYgLXNtcCAy
IC1tIDJHIFwKPj4+Pj4gICAgICAgICAta2VybmVsCj4+Pj4+IC9ob21lL3NvbmcvOV9saW51eC9s
aW51eC8wMF9ydl9kZWYvYXJjaC9yaXNjdi9ib290L0ltYWdlIFwKPj4+Pj4gICAgICAgICAtaW5p
dHJkCj4+Pj4+IC9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkvYnVpbGRyb290L291dHB1dC9pbWFn
ZXMvcm9vdGZzLmV4dDIgXAo+Pj4+PiAgICAgICAgIC1hcHBlbmQgInJvb3Q9L2Rldi9yYW0gcm8g
Y29uc29sZT10dHlTMAo+Pj4+PiBlYXJseWNvbj11YXJ0ODI1MCxtbWlvLDB4MTAwMDAwMDAgZWZp
PWRlYnVnIGxvZ2xldmVsPTgKPj4+Pj4gbWVtYmxvY2s9ZGVidWciICMjIGFsc28gcGFuaWMgYnkg
bWVtdGVzdAo+Pj4+PiBgYGAKPj4+Pj4gMy4gVGhlbiB5b3Ugd2lsbCBlbmNvdW50ZXIgdGhlIGtl
cm5lbCBwYW5pYyBsb2dnZWQgaW4gdGhlIGFib3ZlCj4+Pj4+IGxpbmsKPj4+Pj4gCj4+Pj4+IE90
aGVyIEluZm9ybWF0aW9uOgo+Pj4+PiAKPj4+Pj4gMS4gLS0tLS0tLQo+Pj4+PiAKPj4+Pj4gVGhp
cyByZXBvcnQgaXMgbm90IGlkZW50aWNhbCB0byBteSBwcmlvciByZXBvcnQgLS0gImtlcm5lbAo+
Pj4+PiBwYW5pY2VkIHdoZW4gc3lzdGVtIGhpYmVybmF0ZXMiIFsxXSwgYnV0IGJvdGggb2YgdGhl
bQo+Pj4+PiBhcmUgY2xvc2VseSByZWxhdGVkIHdpdGggdGhlIGNvbW1pdCAoMzMzNTA2OGY4NzIx
ICJyaXNjdjogVXNlCj4+Pj4+IFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBp
bmciKS4KPj4+Pj4gCj4+Pj4+IFdpdGggdGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRyYXBw
ZWQgd2l0aCAiYWNjZXNzIGZhdWx0Igo+Pj4+PiB3aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90
ZWN0ZWQgcmVnaW9ucwo+Pj4+PiAobW1vZGVfcmVzdjBAODAwMDAwMDApCj4+Pj4+IGZyb20gT3Bl
blNiaSAoQlRXLCBoaWJlcm5hdGlvbiBpcyBtYXJrZWQgYXMgbm9ucG9ydGFibGUgYnkKPj4+Pj4g
Q29ub3JbMl0pLgo+Pj4+PiAKPj4+Pj4gSW4gdGhpcyByZXBvcnQsIGVmaV9pbml0IGhhbmRvZmZz
IHRoZSBtZW1vcnkgbWFwcGluZyBmcm9tIEJvb3QKPj4+Pj4gU2VydmljZXMgdG8gbWVtYmxvY2sg
d2hlcmUgcmVzZXJ2ZXMgbW1vZGVfcmVzdjBAODAwMDAwMDAsCj4+Pj4+IHNvIHRoZXJlIGlzIG5v
ICJhY2Nlc3MgZmF1bHQiIGJ1dCAicGFnZSBmYXVsdCIuCj4+Pj4+IAo+Pj4+PiBBbmQgcmV2ZXJ0
aW5nIGNvbW1pdCAzMzM1MDY4Zjg3MjEgaW5kZWVkIGZpeGVkIHRoaXMgcGFuaWMuCj4+Pj4+IAo+
Pj4+PiAyLiAtLS0tLS0tCj4+Pj4+IAo+Pj4+PiBBcyB0aGUgZ2RiLXB0LWR1bXAgWzNdIHRvb2wg
c2hvd3MsIHRoZSBQVEUgd2hpY2ggY292ZXJlZCB0aGUKPj4+Pj4gZmF1bHQgdmlydHVhbCBhZGRy
ZXNzIGhhZCB0aGUgYXBwcm9wcmlhdGUgcGVybWlzc2lvbiB0byBzdG9yZS4KPj4+Pj4gSXMgdGhl
cmUgYW5vdGhlciB3YXkgdG8gdHJpZ2dlciB0aGUgIlN0b3JlL0FNTyBwYWdlIGZhdWx0Ij8gT3IK
Pj4+Pj4gdGhlIGNyZWF0aW9uIG9mIGxpbmVhciBtYXBwaW5nIGluIGNvbW1pdCAzMzM1MDY4Zjg3
MjEgZGlkCj4+Pj4+IHNvbWV0aGluZyB3cm9uZz8KPj4+Pj4gCj4+Pj4+IGBgYAo+Pj4+PiAoZ2Ri
KSBwL3ggJHNhdHAKPj4+Pj4gJDEgPSAweGEwMDAwMDAwMDAwODE3MDgKPj4+Pj4gKGdkYikgcHQg
LXNhdHAgMHhhMDAwMDAwMDAwMDgxNzA4Cj4+Pj4+ICAgICAgICAgICAgICBBZGRyZXNzIDogICAg
IExlbmd0aCAgIFBlcm1pc3Npb25zCj4+Pj4+ICAgMHhmZjFiZmZmZmZlYTM5MDAwIDogICAgIDB4
MTAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+Pj4+PiAgIDB4ZmYxYmZmZmZmZWJmOTAwMCA6ICAgICAw
eDEwMDAgfCBXOjEgWDowIFI6MSBTOjEKPj4+Pj4gICAweGZmMWJmZmZmZmVjMDAwMDAgOiAgIDB4
NDAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4+Pj4+ICAgMHhmZjYwMDAwMDAwMDAwMDAwIDogICAw
eDFjMDAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+Pj4+PiAgIDB4ZmY2MDAwMDAwMDIwMDAwMCA6ICAg
MHhhMDAwMDAgfCBXOjAgWDowIFI6MSBTOjEKPj4+Pj4gICAweGZmNjAwMDAwMDBjMDAwMDAgOiAw
eDdmMDAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxICAvLwo+Pj4+PiBiYWRhZGRyOiBmZjYwMDAwMDdm
ZGIxMDAwCj4+Pj4+ICAgMHhmZjYwMDAwMDdmZGMwMDAwIDogICAgMHgzZDAwMCB8IFc6MSBYOjAg
UjoxIFM6MQo+Pj4+PiAgIDB4ZmY2MDAwMDA3ZmZiZjAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDow
IFI6MSBTOjEKPj4+Pj4gICAweGZmZmZmZmZmODAwMDAwMDAgOiAgIDB4YzAwMDAwIHwgVzowIFg6
MSBSOjEgUzoxCj4+Pj4+ICAgMHhmZmZmZmZmZjgwYzAwMDAwIDogICAweGEwMDAwMCB8IFc6MSBY
OjAgUjoxIFM6MQo+Pj4+PiAKPj4+Pj4gYGBgCj4+Pj4+IAo+Pj4+PiAzLiAtLS0tLS0KPj4+Pj4g
Cj4+Pj4+IFlvdSBjYW4gYWxzbyByZXByb2R1Y2Ugc2ltaWxhciBwYW5pYyBieSBhcHBlbmRpbmcg
Im1lbXRlc3QiIGluCj4+Pj4+IGtlcm5lbCBjbWRsaW5lLgo+Pj4+PiBJIGhhdmUgcG9zdGVkIHRo
ZSBtZW10ZXN0IGJvb3QgbG9nIGF0IHRoaXMgbGluazoKPj4+Pj4gaHR0cHM6Ly90ZXJtYmluLmNv
bS8xdHdsLgo+Pj4+PiAKPj4+Pj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgo+Pj4+
PiAKPj4+Pj4gWzFdOgo+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9D
QUFZczI9Z1F2a2hUZWlvTW1xUkRWR2pkdE5GX3ZoQit2bV8xZEhKeFBOaTc1WURRX1FAbWFpbC5n
bWFpbC5jb20vCj4+Pj4+IFsyXToKPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyMzA1MjYtYXN0cmlkZS1kZXRvbmF0b3ItOWFlMTIwMDUxMTU5QHdlbmR5Lwo+Pj4+
PiBbM106IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5yYWRldi9nZGItcHQtZHVtcAo+Pj4+IAo+
Pj4+IFRoYW5rcyBmb3IgdGhlIHRob3JvdWdoIHJlcG9ydCwgcmVhbGx5IGFwcHJlY2lhdGVkLgo+
Pj4+IAo+Pj4+IFNvIHRoZXJlIGFyZSBtdWx0aXBsZSBpc3N1ZXMgaGVyZToKPj4+PiAKPj4+PiAt
IHRoZSBmaXJzdCBvbmUgaXMgdGhhdCB0aGUgbWVtb3J5IHJlZ2lvbiBmb3Igb3BlbnNiaSBpcyBt
YXJrZWQKPj4+PiBhcyBub3QKPj4+PiBjYWNoZWFibGUgaW4gdGhlIGVmaSBtZW1vcnkgbWFwLCBh
bmQgdGhlbiB0aGlzIHJlZ2lvbiBpcyBub3QKPj4+PiBtYXBwZWQgaW4KPj4+PiB0aGUgbGluZWFy
IG1hcHBpbmc6Cj4+Pj4gWyAgICAwLjAwMDAwMF0gZWZpOiAgIDB4MDAwMDgwMDAwMDAwLTB4MDAw
MDgwMDNmZmZmIFtSZXNlcnZlZCAgIAo+Pj4+IHwgICB8Cj4+Pj4gIHwgIHwgIHwgIHwgIHwgIHwg
IHwgIHwgICB8ICB8ICB8ICB8VUNdCj4+Pj4gCj4+IAo+PiBAQWxleDogVGhlIE9wZW5TQkkgcmVn
aW9uIGlzIG1hcmtlZCByZXNlcnZlZCBiZWNhdXNlIEVESzIgY2hvb3NlcyB0bwo+PiBkbyB0aGF0
IGV4cGxpY2l0bHkgYXMgZXhwbGFpbmVkIGJ5IFN1bmlsLgo+PiBJIGRvbid0IHRoaW5rIFVDIGhh
cyB0byBkbyBhbnl0aGluZyB3aXRoIGl0LiBBbGwgdGhlIEVGSSBtZW1vcnkKPj4gcmVnaW9ucyBh
cmUgVUMuCj4+IAo+Pj4+IC0gdGhlIHNlY29uZCBvbmUgKHRoYXQgSSBmZWVsIGEgYml0IGFzaGFt
ZWQgb2YuLi4pIGlzIHRoYXQgSSBkaWQKPj4+PiBub3QKPj4+PiBjaGVjayB0aGUgYWxpZ25tZW50
IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgd2hlbiBjaG9vc2luZyB0aGUgbWFwCj4+Pj4gc2l6ZQo+
Pj4+IGluIGJlc3RfbWFwX3NpemUoKSBhbmQgdGhlbiB3ZSBlbmQgdXAgdHJ5aW5nIHRvIG1hcCBh
IHBoeXNpY2FsCj4+Pj4gcmVnaW9uCj4+Pj4gYWxpZ25lZCBvbiAyTUIgdGhhdCBpcyBhY3R1YWxs
eSBub3QgYWxpZ25lZCBvbiAyTUIgdmlydHVhbGx5Cj4+Pj4gYmVjYXVzZQo+Pj4+IHRoZSBvcGVu
c2JpIHJlZ2lvbiBpcyBub3QgbWFwcGVkIGF0IGFsbC4KPj4+PiAKPj4+PiAtIHRoZSBwb3NzaWJs
ZSB0aGlyZCBvbmUgaXMgdGhhdCB3ZSBzaG91bGQgbm90IG1hcCB0aGUgbGluZWFyCj4+Pj4gbWFw
cGluZwo+Pj4+IHVzaW5nIDRLIHBhZ2VzLCB0aGlzIHdvdWxkIGJlIHNsb3cgaW4gbXkgb3Bpbmlv
biwgYW5kIEkgdGhpbmsgd2UKPj4+PiBzaG91bGQgd2FzdGUgYSBiaXQgb2YgbWVtb3J5IHRvIGFs
aWduIHZhIGFuZCBwYSBvbiBhIDJNQgo+Pj4+IGJvdW5kYXJ5Lgo+Pj4+IAo+Pj4+IFNvIEknbGwg
Zml4IHRoZSBzZWNvbmQgaXNzdWUsIGFuZCBwb3NzaWJseSB0aGUgdGhpcmQgb25lLCBhbmQgaWYK
Pj4+PiBubwo+Pj4+IG9uZSBsb29rcyBpbnRvIHdoeSB0aGUgb3BlbnNiaSByZWdpb24gaXMgbWFw
cGVkIGluIFVDLCBJJ2xsIHRha2UKPj4+PiBhCj4+Pj4gbG9vayBhdCBlZGsyLgo+Pj4+IAo+Pj4g
SGkgQWxleCwKPj4+IAo+Pj4gRURLMiBtYXJrcyBvcGVuc2JpIHJhbmdlIGFzIHJlc2VydmVkIG1l
bW9yeSBpbiBFRkkgbWFwLiBBY2NvcmRpbmcKPj4+IHRvIERUCj4+PiBzcGVjLCBpZiB0aGUgbm8t
bWFwIGlzIG5vdCBzZXQsIHdlIG5lZWQgdG8gbWFyayBpdCBhcwo+Pj4gRWZpQm9vdFNlcnZpY2Vz
RGF0YSBidXQgRWZpQm9vdFNlcnZpY2VzRGF0YSBpcyBhY3R1YWxseSBjb25zaWRlcmVkCj4+PiBh
cwo+Pj4gZnJlZSBtZW1vcnkgaW4ga2VybmVsLCBhcyBwZXIgVUVGSSBzcGVjLiBUbyBhdm9pZCBr
ZXJuZWwgdXNpbmcgdGhpcwo+Pj4gbWVtb3J5LCB3ZSBkZXZpYXRlZCBmcm9tIHRoZSBEVCBzcGVj
IGZvciBvcGVuc2JpIHJhbmdlcy4KPj4+IAo+PiAKPj4gSU1PLCB0aGF0IHNob3VsZCBiZSB0aGUg
Y29ycmVjdCB3YXkgdW5sZXNzIHdlIGNhbiBjaGFuZ2UgaXQgdG8KPj4gRWZpUnVuU2VydmljZXNE
YXRhL0NvZGUuCj4+IExvb2tpbmcgYXQgVS1Cb290IGNvZGUsIGl0IHNldHMgdGhlIG5vLW1hcCBy
ZWdpb24gdG8KPj4gRWZpQm9vdFNlcnZpY2VzRGF0YSB3aGljaCBtYXkgY2F1c2UKPj4gaXNzdWVz
IGluIFJJU0MtViBhcyB3ZWxsIGlmIHdlIGxpbmVhciBtYXBwaW5nIHNldHMgdXAgdGhlIGluaXRp
YWwKPj4gMk1CLgo+IAo+IFNlbWFudGljYWxseSBJIHRoaW5rIG5vLW1hcCBtZWFucyB0aGUga2Vy
bmVsIHNob3VsZCBub3QgYmUgdXRpbGl6aW5nCj4gaXQsIHNvIGl0IHNob3VsZCBiZSBFZmlSdW5T
ZXJ2aWNlc0RhdGEgaW5zdGVhZC4KCm5vLW1hcCAqaXMqIEVmaVJ1bnRpbWVTZXJ2aWNlc0RhdGEg
aW4gdGhlIERUIHNwZWM7IHRoZSBwcm9ibGVtIGlzIHRoYXQKT3BlblNCSSBpc27igJl0IG1hcmtp
bmcgaXQgbm8tbWFwLCBidXQgaGFzIG5vdGhpbmcgaW4gaXRzIHBsYWNlIHRvIG1hcmsKaXQgYXMg
4oCceW91IGNhbiBtYXAgaXQgYnV0IHlvdSByZWFsbHkgY2Fubm90IHRvdWNoIGl04oCdOyBub3Jt
YWxseQpyZXNlcnZlZCBtZW1vcnkgaXMg4oCcZG9u4oCZdCB0cmVhdCBpdCBhcyBub3JtYWwgbWVt
b3J5IGJ1dCB5b3UgY2FuIHVzZSBpdApmb3Igc3BlY2lmaWMgcHVycG9zZXMgKGUuZy4gRE1BIG1l
bW9yeSBwb29sKeKAnSwgc28gaXQgZ2V0cyB0cmVhdGVkIGFzCnRoZSBsYXR0ZXIgKHdoYXQgdGhh
dCBzdGF0ZSBoYXMgYWx3YXlzIG1lYW50KSBkZXNwaXRlIGRlZmluaXRlbHkgbm90CmJlaW5nIHRo
YXQuIE9yLCB0byBwdXQgaXQgYW5vdGhlciB3YXksIE9wZW5TQkkgd2VudCBmcm9tIHNvbWV0aGlu
ZyB0aGF0CndhcyBjb3JyZWN0LWJ1dC1zbG93IHRvIHNvbWV0aGluZyB0aGF0IGlzIGluY29ycmVj
dC1idXQtZmFzdCBhbmQgdGhlCmNvbnN1bWVycyBvZiB0aGUgRkRUIGFyZSBub3cgcGF5aW5nIHRo
ZSBwcmljZSBmb3IgaXRzIGJyb2tlbm5lc3MuIFNvIHdlCm5lZWQgc29tZSBvdGhlciBhcHByb2Fj
aCB0aGF0IGlzbuKAmXQgaW5jb3JyZWN0IGJ5IGRlZmluaXRpb24uCgpKZXNzCgo+PiAKPj4gCj4+
PiBMZXQgbWUga25vdyB5b3VyIHRob3VnaHRzIGhvdyB3ZSBjYW4gaGFuZGxlIHRoaXMgYmV0dGVy
IGluIEVESzIKPj4+IGNvbnNpZGVyaW5nIGl0IGhhcyB0byBzdXBwb3J0IEFDUEkgYWxzby4KPj4+
IAo+Pj4gVGhhbmtzLAo+Pj4gU3VuaWwKPj4+IAo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+PiAKPj4gCj4+IAo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
