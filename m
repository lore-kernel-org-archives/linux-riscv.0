Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE4ECCA471
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JmyuOjQnXlgKoPeINxl583Noj/PUHU8tT9Z2RfPVGA=; b=MNB6AtgCYyeSJL
	Fg/1ijiJr6HOtvZKjp51O2YT9L5FuovR3mgEH3VcJYawpnjH2mX+kapJ/fbgf0wmumfH0LhI1tKS2
	FGhoxmp/o5ZJ2je+PBhNZ2jLBTeGqvOok7RGC2731cZaeE4sOPohl94MDULsBYpoNAchINcp/f4H9
	6ILhkhEbKGDsIxtxuUBenD4IYvHmZ9hYWbhAq+b531DzB86um3HMf6Kt28JwdeSyoWw7fGwsMM+/B
	a91WZGjgA9Tucul0zAkeSv1jHfhqLxzd915E1qAY+JFMnax3f1n+1T+IOUf38X1+K30UINTeKxvJw
	nDQvY19hGhqE50qzkFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5eww-0000000H2DZ-1QJG;
	Mon, 06 Oct 2025 06:43:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ewt-0000000H2Ct-1J0Q
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 06:43:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so51295565e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Oct 2025 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759733033; x=1760337833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSKdaizxrwGwWb0mgdmG0HgstCpMtkvbzpGWk45LP3M=;
        b=TcgWWmcd8pk3OM7HphxqUVYw1Ty8+mulz559bhVPKlBlYWSbV0pHlvVIH+9rlBIK3+
         FEDaXxbXbuMdpBNc0gtydre8FVRQyEJCGQALywLxmEqZSGMpgZaoew3ni7eHqgYKDMqy
         r1sc3OaUtWK5KhHysJ5JRVVPbDZSWnwuwpave+2iX3IlWMPy81VO8N3rjbKyO8nzNDbL
         VzmWO38CYGkIGUVyWEcFyWxrL2nL/Di7n5VPsv2iw2/qYrKxTzp0G/7O5qV6F75uZ9nn
         mCkcNAEAAGNSM3CwupobdCbqkHogRYALK7CgIK8/BfzYNaE3iIOI6FUQBM2yXOhNBfuI
         DlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733033; x=1760337833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSKdaizxrwGwWb0mgdmG0HgstCpMtkvbzpGWk45LP3M=;
        b=uTPuiT/4i8wRK3lf/B/lis7RjHW5TL3YpgWd1aZZUbZry4a0q/oBllC7HJAueaiCok
         co+URsqracK7EGtzWgkEZh4JaWOrQW4cN3+GHQawo8NtMcBtMa1TNOqgQ5sZdHv1ZpHQ
         yI2Gixn5d6XCKgiy6oNOxmDdqP86pySXrpUCQr6kOphJ0Tsjfyt/hFlMRS6FC137vB3M
         H/HQbw2grHgS3L7t3ZGGtaaDzxQRxh4zlKPpNmSiJ0PjLTKTiAflgvSgKBkuxdGzwlRH
         g2z/L1uPf0EkLXevjvlhP9LiNtH/EKJPHXBSMsw5uHD+Dy9RzOH2bDevylJ01lKn8xMq
         O6zw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMV3vtzNREIUQyctKtBDlxQT6WDux+C9UvGBXWOydkUkS+bh3Ob2gsvjc1IsVfucMEHEn7vc78hUnQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2GkxM4KtX8CQLHePm/gbjTTzfaOmiHOPFBXeak53sXzpQrOr9
	Y5e6JwcMZj4+pFebHHpeE1qmL2TT75vqWDQT9qKnej+udnmDJDU4KDTU48dkRgYJVIU=
X-Gm-Gg: ASbGncu/nhgN1iqR1ttC3DNuwZhH0I8LC75EyxgbHI7bk84Krlwnborn0z1wD8FSmh3
	KPIhiOyN1ShVo4aRjgwNKa850VQpt7+D9D++92J/9tmaiNYjLxKnaXQP7UxEJ35ALGTDIGJqaGQ
	ExaZTjuosCJT6VZTecFWFEh2suUWDWCFnONw5BMIYZHnAYvT1oxkHTvCk/X6eCCDwSVokjrXMWo
	z52Me1935QeTpqP4Bb0Hp6Qbk+DuMQpcxaN8dOKMyuko5H/vDyrENoV9ER8UIWpA/nH8vOWNcbk
	3CC6UK7N0awvDE4r/N6ut3gb3An8x9FsUTr+dd7g0/8d4kix9ISFZKOBdVt3LJHZW5KXfXQZvE+
	U9jL+GZ4emiTzjaTupeYVaxXXBat0Q+ZkORz2PPb1clZF6sCzLHivRvHH+J8hsecqP6EUBQ+c0l
	IATOKN8lJ7OKk7jCs=
X-Google-Smtp-Source: AGHT+IHHPocl07TDjCmmnnWB338xsYMRj+F6fDeyS7IBZh5D64Aw6QpHDiyk/ffxyRjyi2YE9I+aMQ==
X-Received: by 2002:a05:600c:1987:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46e71146083mr71143455e9.26.1759733032715;
        Sun, 05 Oct 2025 23:43:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a4161bsm253473805e9.16.2025.10.05.23.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 23:43:51 -0700 (PDT)
Message-ID: <f42de04a-f6ed-475f-8e49-c7fad5c2d5b9@rivosinc.com>
Date: Mon, 6 Oct 2025 08:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drivers: firmware: add riscv SSE support
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-4-cleger@rivosinc.com>
 <CAAhSdy3fwEZ+SQ3Cgc=GbisshRVQsvUPv23kzDFDd45ic=GObg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAAhSdy3fwEZ+SQ3Cgc=GbisshRVQsvUPv23kzDFDd45ic=GObg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_234355_526479_AB61CBD6 
X-CRM114-Status: GOOD (  19.22  )
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

CgpPbiAwNi8xMC8yMDI1IDA3OjM4LCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDgs
IDIwMjUgYXQgMTE6NTDigK9QTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBBZGQgZHJpdmVyIGxldmVsIGludGVyZmFjZSB0byB1c2UgUklTQy1WIFNT
RSBhcmNoIHN1cHBvcnQuIFRoaXMgaW50ZXJmYWNlCj4+IGFsbG93cyByZWdpc3RlcmluZyBTU0Ug
aGFuZGxlcnMsIGFuZCByZWNlaXZlIHRoZW0uIFRoaXMgd2lsbCBiZSB1c2VkIGJ5Cj4+IFBNVSBh
bmQgR0hFUyBkcml2ZXIuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogSGltYW5zaHUgQ2hhdWhhbiA8
aGNoYXVoYW5AdmVudGFuYW1pY3JvLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hh
dWhhbiA8aGNoYXVoYW5AdmVudGFuYW1pY3JvLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gLS0tCj4+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxNSArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL0tjb25m
aWcgICAgICAgICAgICAgICB8ICAgMSArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlICAg
ICAgICAgICAgICB8ICAgMSArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgICAg
ICAgICB8ICAxNSArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlICAgICAgICB8
ICAgMyArCj4+ICBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NiaV9zc2UuYyB8IDcwMSAr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NiaV9zc2Uu
aCAgICAgICAgICB8ICA1NyArKwo+PiAgNyBmaWxlcyBjaGFuZ2VkLCA3OTMgaW5zZXJ0aW9ucygr
KQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZwo+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NiaV9zc2Uu
Ywo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcmlzY3Zfc2JpX3NzZS5oCj4+
Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4IGZlMTY4
NDc3Y2FhNC4uNjg0ZDIzZjg1MmMzIDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJTkVSUwo+PiArKysg
Yi9NQUlOVEFJTkVSUwo+PiBAQCAtMjE2NDgsNiArMjE2NDgsMTMgQEAgVDogICAgIGdpdCBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaW9tbXUvbGludXguZ2l0
Cj4+ICBGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2
LGlvbW11LnlhbWwKPj4gIEY6ICAgICBkcml2ZXJzL2lvbW11L3Jpc2N2Lwo+Pgo+PiArUklTQy1W
IEZJUk1XQVJFIERSSVZFUlMKPj4gK006ICAgICBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+Cj4+ICtMOiAgICAgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiArUzogICAg
IE1haW50YWluZWQKPj4gK1Q6ICAgICBnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdAo+PiArRjogICAgIGRyaXZlcnMvZmlybXdh
cmUvcmlzY3YvKgo+PiArCj4+ICBSSVNDLVYgTUlDUk9DSElQIEZQR0EgU1VQUE9SVAo+PiAgTTog
ICAgIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+ICBNOiAgICAg
RGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+Cj4+IEBAIC0yMTcx
Miw2ICsyMTcxOSwxNCBAQCBGOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC8KPj4g
IE46ICAgICBzcGFjZW1pdAo+PiAgSzogICAgIHNwYWNlbWl0Cj4+Cj4+ICtSSVNDLVYgU1NFIERS
SVZFUgo+PiArTTogICAgIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4g
K1I6ICAgICBIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodUB0aGVjaGF1aGFuLmRldj4KPj4gK0w6
ICAgICBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+ICtTOiAgICAgTWFpbnRhaW5l
ZAo+PiArRjogICAgIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zfc3NlLmMKPj4gK0Y6ICAg
ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCj4+ICsKPj4gIFJJU0MtViBUSEVBRCBTb0MgU1VQ
UE9SVAo+PiAgTTogICAgIERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+PiAgTTog
ICAgIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9m
aXJtd2FyZS9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCj4+IGluZGV4IGJiZDIx
NTVkODQ4My4uMTg5NGRmODdiMDhlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL0tj
b25maWcKPj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnCj4+IEBAIC0yOTQsNiArMjk0
LDcgQEAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJlL21lc29uL0tjb25maWciCj4+ICBzb3VyY2Ug
ImRyaXZlcnMvZmlybXdhcmUvbWljcm9jaGlwL0tjb25maWciCj4+ICBzb3VyY2UgImRyaXZlcnMv
ZmlybXdhcmUvcHNjaS9LY29uZmlnIgo+PiAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJlL3Fjb20v
S2NvbmZpZyIKPj4gK3NvdXJjZSAiZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmlnIgo+PiAg
c291cmNlICJkcml2ZXJzL2Zpcm13YXJlL3NhbXN1bmcvS2NvbmZpZyIKPj4gIHNvdXJjZSAiZHJp
dmVycy9maXJtd2FyZS9zbWNjYy9LY29uZmlnIgo+PiAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJl
L3RlZ3JhL0tjb25maWciCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxl
IGIvZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZQo+PiBpbmRleCA0ZGRlYzI4MjBjOTYuLjZjZGQ4
NDU3MGVhNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZQo+PiArKysg
Yi9kcml2ZXJzL2Zpcm13YXJlL01ha2VmaWxlCj4+IEBAIC0zNCw2ICszNCw3IEBAIG9iai15ICAg
ICAgICAgICAgICAgICAgICAgICAgICs9IGVmaS8KPj4gIG9iai15ICAgICAgICAgICAgICAgICAg
ICAgICAgICArPSBpbXgvCj4+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gcHNj
aS8KPj4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBxY29tLwo+PiArb2JqLXkg
ICAgICAgICAgICAgICAgICAgICAgICAgICs9IHJpc2N2Lwo+PiAgb2JqLXkgICAgICAgICAgICAg
ICAgICAgICAgICAgICs9IHNhbXN1bmcvCj4+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAg
ICAgKz0gc21jY2MvCj4+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gdGVncmEv
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcgYi9kcml2ZXJz
L2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5lZDViNjYzYWM1ZjkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2
ZXJzL2Zpcm13YXJlL3Jpc2N2L0tjb25maWcKPj4gQEAgLTAsMCArMSwxNSBAQAo+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+ICttZW51ICJSaXNjLVYgU3BlY2lm
aWMgZmlybXdhcmUgZHJpdmVycyIKPj4gK2RlcGVuZHMgb24gUklTQ1YKPj4gKwo+PiArY29uZmln
IFJJU0NWX1NCSV9TU0UKPj4gKyAgICAgICBib29sICJFbmFibGUgU0JJIFN1cGVydmlzb3IgU29m
dHdhcmUgRXZlbnRzIHN1cHBvcnQiCj4+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkKPj4g
KyAgICAgICBkZWZhdWx0IHkKPj4gKyAgICAgICBoZWxwCj4+ICsgICAgICAgICBUaGUgU3VwZXJ2
aXNvciBTb2Z0d2FyZSBFdmVudHMgc3VwcG9ydCBhbGxvd3MgdGhlIFNCSSB0byBkZWxpdmVyCj4+
ICsgICAgICAgICBOTUktbGlrZSBub3RpZmljYXRpb25zIHRvIHRoZSBzdXBlcnZpc29yIG1vZGUg
c29mdHdhcmUuIFdoZW4gZW5hYmxlZCwKPj4gKyAgICAgICAgIHRoaXMgb3B0aW9uIHByb3ZpZGVz
IHN1cHBvcnQgdG8gcmVnaXN0ZXIgY2FsbGJhY2tzIG9uIHNwZWNpZmljIFNTRQo+PiArICAgICAg
ICAgZXZlbnRzLgo+PiArCj4+ICtlbmRtZW51Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13
YXJlL3Jpc2N2L01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQo+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM4Nzk1ZDRiYmIyZQo+
PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvTWFrZWZpbGUK
Pj4gQEAgLTAsMCArMSwzIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4+ICsKPj4gK29iai0kKENPTkZJR19SSVNDVl9TQklfU1NFKSAgICAgICAgICAgICs9IHJpc2N2
X3NiaV9zc2Uubwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9z
Ymlfc3NlLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NiaV9zc2UuYwo+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjU3YjZkYWQ5MjQ4Mgo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zfc2JpX3Nz
ZS5jCj4+IEBAIC0wLDAgKzEsNzAxIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5Cj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDI0IFJpdm9zIEluYy4K
Pj4gKyAqLwo+PiArCj4+ICsjZGVmaW5lIHByX2ZtdChmbXQpICJzc2U6ICIgZm10Cj4+ICsKPj4g
KyNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9jcHVob3RwbHVnLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvaGFyZGly
cS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wZXJj
cHUtZGVmcy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgo+PiArI2luY2x1ZGUgPGxp
bnV4L3Jpc2N2X3NiaV9zc2UuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+ICsKPj4g
KyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3NzZS5oPgo+PiArCj4+ICtz
dHJ1Y3Qgc3NlX2V2ZW50IHsKPj4gKyAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4+ICsg
ICAgICAgdTMyIGV2dF9pZDsKPj4gKyAgICAgICB1MzIgcHJpb3JpdHk7Cj4+ICsgICAgICAgc3Nl
X2V2ZW50X2hhbmRsZXJfZm4gKmhhbmRsZXI7Cj4+ICsgICAgICAgdm9pZCAqaGFuZGxlcl9hcmc7
Cj4+ICsgICAgICAgLyogT25seSB2YWxpZCBmb3IgZ2xvYmFsIGV2ZW50cyAqLwo+PiArICAgICAg
IHVuc2lnbmVkIGludCBjcHU7Cj4+ICsKPj4gKyAgICAgICB1bmlvbiB7Cj4+ICsgICAgICAgICAg
ICAgICBzdHJ1Y3Qgc3NlX3JlZ2lzdGVyZWRfZXZlbnQgKmdsb2JhbDsKPj4gKyAgICAgICAgICAg
ICAgIHN0cnVjdCBzc2VfcmVnaXN0ZXJlZF9ldmVudCBfX3BlcmNwdSAqbG9jYWw7Cj4+ICsgICAg
ICAgfTsKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBpbnQgc3NlX2hwX3N0YXRlOwo+PiArc3RhdGlj
IGJvb2wgc3NlX2F2YWlsYWJsZSBfX3JvX2FmdGVyX2luaXQ7Cj4+ICtzdGF0aWMgREVGSU5FX1NQ
SU5MT0NLKGV2ZW50c19saXN0X2xvY2spOwo+PiArc3RhdGljIExJU1RfSEVBRChldmVudHMpOwo+
PiArc3RhdGljIERFRklORV9NVVRFWChzc2VfbXV0ZXgpOwo+PiArCj4+ICtzdHJ1Y3Qgc3NlX3Jl
Z2lzdGVyZWRfZXZlbnQgewo+PiArICAgICAgIHN0cnVjdCBzc2VfZXZlbnRfYXJjaF9kYXRhIGFy
Y2g7Cj4+ICsgICAgICAgc3RydWN0IHNzZV9ldmVudCAqZXZlbnQ7Cj4+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyBhdHRyOwo+PiArICAgICAgIGJvb2wgaXNfZW5hYmxlZDsKPj4gK307Cj4+ICsKPiAK
PiA8c25pcD4KPiAKPj4gKwo+PiArc3RhdGljIGludCBfX2luaXQgc3NlX2luaXQodm9pZCkKPj4g
K3sKPj4gKyAgICAgICBpbnQgcmV0Owo+PiArCj4+ICsgICAgICAgaWYgKHNiaV9wcm9iZV9leHRl
bnNpb24oU0JJX0VYVF9TU0UpIDw9IDApIHsKPj4gKyAgICAgICAgICAgICAgIHByX2VycigiTWlz
c2luZyBTQkkgU1NFIGV4dGVuc2lvblxuIik7Cj4gCj4gV2UgbWlnaHQgaGF2ZSBvbGRlciBmaXJt
d2FyZSB3aGljaCBpbXBsZW1lbnRzIGFuIG9sZGVyCj4gU0JJIHNwZWMgdmVyc2lvbiBzbyB3ZSBz
aG91bGQgbm90IHRocm93IGVycm9ycyBvdmVyIGhlcmUuCj4gUGxlYXNlIGNoYW5nZSB0aGlzIHRv
IHByX2luZm8oKS4KClllYWggaW5kZWVkLCB0aGF0IG1pZ2h0IGNvbmZ1c2UgdGhlIGVuZC11c2Vy
LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gUmVnYXJkcywKPiBBbnVwCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
