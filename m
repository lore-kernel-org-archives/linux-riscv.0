Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B4DC61DB9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0vtR679iJfi5IJ+9pjwuyGU2GBcfgS1Zeg/qADqDfs=; b=P6tq+LljhS4ZUj
	ixTbL446Fb2AabjKMGLblByktQorhQ/zgCDrGx54xQP2ArfdEAc5jrJS3sXAp9tBSI7o0vU0vkANs
	0FdG4q6PrZt85Nywz08n7jt0yIJH4SFI6JK/mFvcYkNf8O7MgTGJr+SExjMG0b3MHZNxxah3E2eLD
	nuB2YcIxPHnpMwTKAck13D2F99ayNppK0yO6XkLz0wC6j8p2dGnTBK+OU8GK/auFkDm/sSqhledE1
	mEiltsKFsTygvWhUuQzohRVKrL0x/RDWbkQHbsbmGMbmzbZCAmtE41BC2Ud7kro90BbrUPd2CPKmy
	9fmkoxIH1/BJFV7QMVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08kJ-00000006boZ-0qej;
	Sat, 29 Aug 2026 02:24:39 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08kG-00000006boB-2v9P
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 02:24:38 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so816948a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787970275; x=1788575075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+slNTZNH7eKf4SNfKudrYju+TQTUNZhz+DW3HyZw7Oo=;
        b=FoVQt1pRJslX65uZT0dj+x6wpVTYadGT6v2SZ1iZPrpgHswhwEQRdwl0AS1zR1NhzL
         5e1H4ahsMtKdBccmZkhuhKfpx7+YDxQI8R0AECXtle38Y3zm0d2nEjCoZ8wK5UzfmXDT
         viFsNQ4Q6VXThHdOmRsRwHyrw/0p/FUYHkxdoTEgkytjQOaMjU9Q+yvXOgLn32qrROj/
         d4ZweWBL5WdXyyOwc3wNWNRG/HqkBlOL65YN5jPAnrRWM0OOHrJbuOe01J3KesK13DTA
         MXgYNdWTic+3RI4L5cZ8EoEgvP8D4X5SlKb3QHgvswdpls2qVQ8dWinxMKjVIklJ7QY9
         ZKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787970275; x=1788575075;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+slNTZNH7eKf4SNfKudrYju+TQTUNZhz+DW3HyZw7Oo=;
        b=DHDOcMAzLPBaywdyAplbuVjQm1z1qUuw2yOXUlJgi5WIoWwAqHA+txq/fBtziDG6Mu
         uoEnMJG+jdCddkzzsBLmyrrMKrYKFMXO/LRTcQC05Cs1aR/Y8qygpjDuMdfYxeBK79Op
         XgAmxfa7Ny2WWdU/1Dz/gS3WS08YkNC5vrB3gJ59l7VaKaoxRZ417T1FeF9LHa3ukXUi
         sszon/rO6h9urFsp+rWgDSifdeAeycvAfjSaiVjK3dNtq9zBjtcX5LMGD5lZs6YgkgLO
         W7cYwXNA+qXRwhTpwUg1wy8/GS9yeUzXj0HAktAFsBU7gYeaoisUF8h17uLZDK6NGBHl
         tAcA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ4K1RYzw9IeRE2v1lY0uINkMFa9g/h/ha6E0VSEsyi9YsYy1Y8+1lA5vZMP8y4Q1OzhrPgKG0NUKb5g==@lists.infradead.org
X-Gm-Message-State: AFuF++naSG/4MhlI5SgWzoZiiyNhlBiWl9LGnK/XZW+U/g0fI0W7D3CW
	JAJrPIO0/Ds/mN0l0lVcGF5gu8X9jlpppfl1JQbolZIjIt7eHZUJzdcr
X-Gm-Gg: AR+sD10qhJir8w26olc2c9xy7xWQaF6RRVMO1fm/tU7kj1T/3ZUTjWftS/sWuMFQG0z
	26dUnP4wDCwi7zwE0wMBb/nUFYrEwrZQvUDQxrRmNo06bdOr1Onxe50p+V11xLe/ySeF/St4TYm
	NufFtHBHo41Io/doGj90DElDIZWRv5jzwsKtS7yjJiZLMU3C9RHtSxYLkpflJSfnj/EcqsU4TMA
	ve2yDjfzrzAuoNcskMOaVv0yV7/6N6ok9mTrvFRsYITO4tOwZ1Ounxo138+oacbfwDAHCKz752i
	OOV1r8vrTyMD1usWGvYFN9+tFnmqD5UFiFfGKEP2ThESJzwGQMQSAAsgwNhjlllBYipW5h1eYih
	OCP6t5USY40TxxhE54O0nSaWhFczPddDWOH5uCKL5nlg7SlNeNj4jmmBFAV7nL00XQ6ZJkX9cYn
	tFGfT1RiYBAoy24+PPVkHpooSCo2E7aBaSENruknUNN5WVRMiynIpwAMi47vHM1Rx56rvDaDCxW
	w==
X-Received: by 2002:a05:6a00:2289:b0:852:355b:2430 with SMTP id d2e1a72fcca58-8562a001846mr21104959b3a.10.1787970275425;
        Fri, 28 Aug 2026 19:24:35 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49f50bsm1108486b3a.11.2026.08.28.19.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:24:35 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yukai Wu <xiaoyewuz.Ruster@gmail.com>
Subject: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Sat, 29 Aug 2026 10:23:27 +0800
Message-ID: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_192436_766685_2CD8B160 
X-CRM114-Status: UNSURE (   8.75  )
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

VXBkYXRlIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdCB0cmFu
c2xhdGlvbi4KClVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgZWQ4NDNhZTk0
N2Y4CigiZG9jczogbW92ZSByaXNjdiB1bmRlciBhcmNoIikKClNpZ25lZC1vZmYtYnk6IFl1a2Fp
IFd1IDx4aWFveWV3dXouUnVzdGVyQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6CiAtIENo
YW5nZWQgIuihpeS4gei3n+i4quezu+e7nyIgdG8gIlBhdGNod29yayIuCiAtIENvcnJlY3RlZCBi
cmFuY2ggc2VsZWN0aW9uIHRvICJmb3ItbmV4dCDmiJYgZml4ZXMiICh3YXMgIuWSjCIpLgogLSBB
ZGp1c3RlZCAi5bey5om55YeGIiBvciAi5bey5Ya757uTIiBvcmRlci4KIC0gQ2hhbmdlZCAi5Y+q
5o6l5Y+XIiB0byAi5Y+q6ICD6JmRIi4KIC4uLi96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2Vw
dGFuY2UucnN0ICAgICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0IGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRh
bmNlLnJzdAppbmRleCBjOGViMjMwY2E4ZWUuLjIwYjkxZDA0MzNhOSAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNl
LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3Bh
dGNoLWFjY2VwdGFuY2UucnN0CkBAIC0xNSwxOSArMTUsNDEgQEAgYXJjaC9yaXNjdiDlvIDlj5Ho
gIXnu7TmiqTmjIfljZcKIAog5qaC6L+wCiAtLS0tCi1SSVNDLVbmjIfku6Tpm4bkvZPns7vnu5Pm
noTmmK/lhazlvIDlvIDlj5HnmoTvvJoKK1JJU0MtViDmjIfku6Tpm4bkvZPns7vnu5PmnoTmmK/l
hazlvIDlvIDlj5HnmoTvvJoKIOato+WcqOi/m+ihjOeahOiNieahiOWPr+S+m+aJgOacieS6uuaf
peeci+WSjOa1i+ivleWunueOsOOAguaWsOaooeWdl+aIluiAheaJqeWxleiNieahiOWPr+iDveS8
muWcqOW8gOWPkei/h+eoi+S4reWPkQot55Sf5pu05pS5LS0t5pyJ5pe25Lul5LiN5YW85a6555qE
5pa55byP5a+55Lul5YmN55qE6I2J5qGI6L+b6KGM5pu05pS544CC6L+Z56eN54G15rS75oCn5Y+v
6IO95Lya57uZUklTQy1WIExpbnV4Ci3nu7TmiqTogIXluKbmnaXmjJHmiJjjgIJMaW51eOW8gOWP
kei/h+eoi+abtOWWnOasoue7j+i/h+iJr+WlveajgOafpeWSjOa1i+ivleeahOS7o+egge+8jOiA
jOS4jeaYr+ivlemqjOS7o+eggeOAguaIkQot5Lus5biM5pyb5o6o5bm/5ZCM5qC355qE6KeE5YiZ
5Yiw5Y2z5bCG6KKr5YaF5qC45ZCI5bm255qEUklTQy1W55u45YWz5Luj56CB44CCCivnlJ/mm7Tm
lLkgLS0tIOacieaXtuS7peS4jeWFvOWuueeahOaWueW8j+WvueS7peWJjeeahOiNieahiOi/m+ih
jOabtOaUueOAgui/meenjeeBtea0u+aAp+WPr+iDveS8mue7mSBSSVNDLVYKK0xpbnV4IOe7tOaK
pOiAheW4puadpeaMkeaImOOAgkxpbnV4IOe7tOaKpOiAheS4jei1nuaIkOmikee5geeahOWPmOab
tO+8jOS4lCBMaW51eCDlvIDlj5Hov4fnqIvmm7TllpzmrKLnu4/ov4cKK+iJr+WlveajgOafpeWS
jOa1i+ivleeahOS7o+egge+8jOiAjOS4jeaYr+ivlemqjOS7o+eggeOAguaIkeS7rOW4jOacm+aO
qOW5v+WQjOagt+eahOinhOWImeWIsOWNs+Wwhuiiq+WGheaguOWQiOW5tueahAorUklTQy1WIOeb
uOWFs+S7o+eggeOAggorCitQYXRjaHdvcmsKKy0tLS0tLS0tLQorCitSSVNDLVYg5pyJ5LiA5Liq
IHBhdGNod29yayDlrp7kvovvvIzlj6/ku6XlnKjpgqPph4zmn6XnnIvooaXkuIHnmoTnirbmgIHv
vJoKKworICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3Yv
bGlzdC8KKwor5aaC5p6c5L2g55qE6KGl5LiB5LiN5Zyo6buY6K6k6KeG5Zu+5Lit5Ye6546w77yM
6YKj5LmIIFJJU0MtViDnu7TmiqTogIXlvojmnInlj6/og73lt7LopoHmsYLkv67mlLnvvIzmiJbo
gIXluIzmnJsKK+WwhuWFtuW6lOeUqOWIsOWPpuS4gOS4quS7o+eggeagkeS4iuOAggorCivoh6rl
iqjljJbmtYHnqIvkvJrlnKjor6UgcGF0Y2h3b3JrIOWunuS+i+S4iui/kOihjO+8jOWcqOavj+S4
quihpeS4geWIsOi+vuaXtueri+WIu+WvueWFtui/m+ihjOaehOW7ui/mtYvor5XjgIIKK+iHquWK
qOWMlua1geeoi+S8muagueaNruihpeS4geaYr+WQpuiiq+ivhuWIq+S4uuS/ruWkje+8jOmAieeU
qCBSSVNDLVYgYGZvci1uZXh0YCDmiJYgYGZpeGVzYCDliIbmlK8KK+W9k+WJjeeahCBIRUFE77yb
6Iul5LiK6L+w5Z2H5bqU55So5aSx6LSl77yM5YiZ5L2/55SoIFJJU0MtViBgbWFzdGVyYCDliIbm
lK/jgILooaXkuIHns7vliJfooqvlupTnlKjliLDnmoTlhbcKK+S9k+aPkOS6pOWwhuagh+azqOWc
qCBwYXRjaHdvcmsg5LiK44CC5Lu75L2V5qOA5p+l5pyq6YCa6L+H55qE6KGl5LiB6YCa5bi45LiN
5Lya6KKr5bqU55So77yM5bm25LiU5Zyo5aSn5aSa5pWw5oOFCivlhrXkuIvlsIbpnIDopoHph43m
lrDmj5DkuqTjgIIKIAog6ZmE5Yqg55qE5o+Q5Lqk5qOA5p+l5Y2VCiAtLS0tLS0tLS0tLS0tLS0t
Ci3miJHku6zku4XmjqXlj5fnm7jlhbPmoIflh4blt7Lnu4/ooqtSSVNDLVbln7rph5HkvJrmoIfl
h4bkuLrigJzlt7Lmibnlh4bigJ3miJbigJzlt7Llhrvnu5PigJ3nmoTmianlsZXmiJbmqKHlnZfn
moTooaXkuIHjgIIKLe+8iOW8gOWPkeiAheW9k+eEtuWPr+S7pee7tOaKpOiHquW3seeahExpbnV4
5YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5omA6ZyA5Luj56CB5omp5bGV6I2J5qGI55qE5Luj56CB
44CC77yJCi0KLeatpOWklu+8jFJJU0MtVuinhOiMg+WFgeiuuOeIseWlveiAheWIm+W7uuiHquW3
seeahOiHquWumuS5ieaJqeWxleOAgui/meS6m+iHquWumuS5ieaLk+WxleS4jemcgOimgemAmui/
h1JJU0MtVgot5Z+66YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG44CC5Li65LqG6YG/5YWN
5bCG54ix5aW96ICF5LiA5Lqb54m55Yir55qEUklTQy1W5ouT5bGV5re75Yqg6L+b5YaF5qC45Luj
56CB5bim5p2lCi3nmoTnu7TmiqTlpI3mnYLmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43v
vIzmiJHku6zlsIblj6rmjqXlj5dSSVNDLVbln7rph5HkvJrmraPlvI/lhrvnu5PmiJbmibnlh4bn
moTnmoTmianlsZUKLeihpeS4geOAgu+8iOW8gOWPkeiAheW9k+eEtuWPr+S7pee7tOaKpOiHquW3
seeahExpbnV45YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5LuW5Lus5oOz6KaB55qE5Lu75L2V6Ieq
5a6a5LmJ5omp5bGVCi3nmoTku6PnoIHjgILvvIkKK+aIkeS7rOS7heaOpeWPl+mSiOWvueaWsOao
oeWdl+aIluaJqeWxleeahOihpeS4ge+8jOWJjeaPkOaYr+i/meS6m+aooeWdl+aIluaJqeWxleea
hOinhOiMg+iiq+WIl+S4uuacquadpeS4jeWkquWPr+iDveWPkQor55Sf5LiN5YW85a6555qE5Y+Y
5pu044CC5a+55LqO5p2l6IeqIFJJU0MtViDln7rph5HkvJrnmoTop4TojIPvvIzov5nmhI/lkbPn
nYDigJzlt7Llhrvnu5PigJ3miJbigJzlt7Lmibnlh4bigJ3vvIzlr7nkuo4KK1VFRkkg6K665Z2b
55qE6KeE6IyD77yM6L+Z5oSP5ZGz552A5bey5Y+R5biD55qEIEVDUuOAgu+8iOW8gOWPkeiAheW9
k+eEtuWPr+S7pee7tOaKpOiHquW3seeahCBMaW51eCDlhoXmoLjmoJHvvIwKK+WFtuS4reWMheWQ
q+S7luS7rOaJgOmcgOeahOS7u+S9leaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQorCivmraTl
pJbvvIxSSVNDLVYg6KeE6IyD5YWB6K645a6e546w6ICF5Yib5bu66Ieq5bex55qE6Ieq5a6a5LmJ
5omp5bGV44CC6L+Z5Lqb6Ieq5a6a5LmJ5omp5bGV5LiN6ZyA6KaB6YCa6L+HIFJJU0MtVgor5Z+6
6YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG5rWB56iL44CC5Li65LqG6YG/5YWN5Zug5re7
5Yqg5a6e546w6ICF54m55a6a55qEIFJJU0MtViDmianlsZXluKbmnaXnmoTnu7TmiqTlpI3mnYIK
K+aAp+WSjOWvueaAp+iDveeahOa9nOWcqOW9seWTje+8jOaIkeS7rOWwhuWPquiAg+iZkeespuWQ
iOS7peS4i+S7u+S4gOadoeS7tueahOaJqeWxleihpeS4ge+8mgorCistIOW3sueUsSBSSVNDLVYg
5Z+66YeR5Lya5q2j5byP5Ya757uT5oiW5om55YeGCistIOW3suaMieeFp+agh+WHhiBMaW51eCDm
g6/kvovvvIzlnKjlub/ms5vlj6/nlKjnmoTnoazku7bkuK3lrp7njrAKKwor77yI5a6e546w6ICF
5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jOWFtuS4reWMheWQ
q+S7luS7rOaJgOmcgOeahOS7u+S9leiHquWumuS5ieaJqeWxleeahOS7o+eggeOAgu+8iQotLSAK
Mi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
