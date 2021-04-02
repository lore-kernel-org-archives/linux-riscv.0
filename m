Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619CFC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:34:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B3661057
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B3661057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zIU9WIFhXnDsy/jp669hFaiZgMj+VaWu7ms0fPStvW4=; b=oTFL+7Y6im8MnLOGIxZYbUNNO
	YK469vjYAPm3l42YYvnEfX7WHHroH2zdV/bPjEifBBvTLa5fV6zR3gQCnXjrZ2XFYOYW4sYKilfLJ
	XgGB1l2FhMDo9wcq8hHLUcySyPOJViu2RU4A/xKUWJLl5mBWf5sGwpiun7Y0wY+uJuZtw+XL8LMQ6
	g2FwY5vTZUdc1Yt0ocsaAsH1s7RozmfI0XHwiUkbmED+mpWXXqvqL+uCsjW365L0ozKQBTeBbUHs8
	vIk4NNDlJvZzKUdvEDe41A4CcKYfy8hrj+Umn3C+fVLHdTzT5zluMKbL5/0PhMN5dKhEQAnAhga4O
	2nQSNXpTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLoS-00DLsv-O9; Fri, 02 Apr 2021 15:34:20 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLoH-00DLqf-06; Fri, 02 Apr 2021 15:34:10 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkc810p9z9v2m9;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E-R23ddmhdI0; Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkc76Npnz9v2m8;
 Fri,  2 Apr 2021 17:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE3098BB77;
 Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KbAlGNza6YEe; Fri,  2 Apr 2021 17:34:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C1048BB6F;
 Fri,  2 Apr 2021 17:34:00 +0200 (CEST)
Subject: Re: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
To: "Tan, Ley Foon" <ley.foon.tan@intel.com>,
 "will@kernel.org" <will@kernel.org>, "danielwa@cisco.com"
 <danielwa@cisco.com>, "robh@kernel.org" <robh@kernel.org>,
 "daniel@gimpelevich.san-francisco.ca.us"
 <daniel@gimpelevich.san-francisco.ca.us>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, microblaze <monstr@monstr.eu>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
 <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <18f89697-5612-6a1a-ab9d-8842c1b943db@csgroup.eu>
Date: Fri, 2 Apr 2021 17:33:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_163409_352015_3A076EDC 
X-CRM114-Status: GOOD (  14.44  )
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

CgpMZSAyOS8wMy8yMDIxIMOgIDAzOjM1LCBUYW4sIExleSBGb29uIGEgw6ljcml0wqA6Cj4gCj4g
Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4KPj4gU2VudDogRnJpZGF5LCBNYXJjaCAyNiwg
MjAyMSA5OjQ1IFBNCj4+IFRvOiB3aWxsQGtlcm5lbC5vcmc7IGRhbmllbHdhQGNpc2NvLmNvbTsg
cm9iaEBrZXJuZWwub3JnOwo+PiBkYW5pZWxAZ2ltcGVsZXZpY2guc2FuLWZyYW5jaXNjby5jYS51
cwo+PiBDYzogbGludXgtYXJjaEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eHBwYy0KPj4gZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLQo+PiBkZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBtaWNyb2JsYXplCj4+IDxtb25zdHJAbW9u
c3RyLmV1PjsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc7IFRhbiwgTGV5IEZvb24KPj4gPGxl
eS5mb29uLnRhbkBpbnRlbC5jb20+OyBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZzsgbGlu
dXgtCj4+IGhleGFnb25Admdlci5rZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnOyB4ODZAa2VybmVsLm9yZzsKPj4gbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmc7
IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZzsKPj4gc3BhcmNsaW51eEB2Z2VyLmtlcm5lbC5vcmcK
Pj4gU3ViamVjdDogW1BBVENIIHYzIDA5LzE3XSBuaW9zMjogQ29udmVydCB0byBHRU5FUklDX0NN
RExJTkUKPj4KPj4gVGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01E
TElORS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gICBhcmNoL25pb3MyL0tjb25maWcgICAgICAgIHwg
MjQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAu
YyB8IDEzICsrKystLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMzIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL25pb3MyL0tjb25maWcg
Yi9hcmNoL25pb3MyL0tjb25maWcgaW5kZXgKPj4gYzI0OTU1YzgxYzkyLi5mNjZjOTdiMTU4MTMg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbmlvczIvS2NvbmZpZwo+PiArKysgYi9hcmNoL25pb3MyL0tj
b25maWcKPj4gQEAgLTkwLDMxICs5MCw5IEBAIGNvbmZpZyBOSU9TMl9BTElHTk1FTlRfVFJBUAo+
Pgo+PiAgIGNvbW1lbnQgIkJvb3Qgb3B0aW9ucyIKPj4KPj4gLWNvbmZpZyBDTURMSU5FX0JPT0wK
Pj4gLQlib29sICJEZWZhdWx0IGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKPj4gLQlkZWZh
dWx0IHkKPj4gLQo+PiAtY29uZmlnIENNRExJTkUKPj4gLQlzdHJpbmcgIkRlZmF1bHQga2VybmVs
IGNvbW1hbmQgc3RyaW5nIgo+PiAtCWRlZmF1bHQgIiIKPj4gLQlkZXBlbmRzIG9uIENNRExJTkVf
Qk9PTAo+PiAtCWhlbHAKPj4gLQkgIE9uIHNvbWUgcGxhdGZvcm1zLCB0aGVyZSBpcyBjdXJyZW50
bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIgdG8KPj4gLQkgIHBhc3MgYXJndW1lbnRzIHRv
IHRoZSBrZXJuZWwuIEZvciB0aGVzZSBwbGF0Zm9ybXMsIHlvdSBjYW4gc3VwcGx5Cj4+IC0JICBz
b21lIGNvbW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBo
ZXJlLiAgSW4KPj4gLQkgIG90aGVyIGNhc2VzIHlvdSBjYW4gc3BlY2lmeSBrZXJuZWwgYXJncyBz
byB0aGF0IHlvdSBkb24ndCBoYXZlCj4+IC0JICB0byBzZXQgdGhlbSB1cCBpbiBib2FyZCBwcm9t
IGluaXRpYWxpemF0aW9uIHJvdXRpbmVzLgo+PiAtCj4+IC1jb25maWcgQ01ETElORV9GT1JDRQo+
PiAtCWJvb2wgIkZvcmNlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+PiAtCWRlcGVu
ZHMgb24gQ01ETElORV9CT09MCj4+IC0JaGVscAo+PiAtCSAgU2V0IHRoaXMgdG8gaGF2ZSBhcmd1
bWVudHMgZnJvbSB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcKPj4gLQkgIG92ZXJy
aWRlIHRob3NlIHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIuCj4+IC0KPj4gICBjb25maWcgTklP
UzJfQ01ETElORV9JR05PUkVfRFRCCj4+ICAgCWJvb2wgIklnbm9yZSBrZXJuZWwgY29tbWFuZCBz
dHJpbmcgZnJvbSBEVEIiCj4+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKPj4gKwlkZXBlbmRz
IG9uIENNRExJTkUgIT0gIiIKPj4gICAJZGVwZW5kcyBvbiAhQ01ETElORV9GT1JDRQo+PiAgIAlk
ZWZhdWx0IHkKPj4gICAJaGVscAo+IAo+IE1pc3NpbmcgIiBzZWxlY3QgR0VORVJJQ19DTURMSU5F
IiA/CgpBZGRlZCBpbiB2NAoKVGhhbmtzCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
