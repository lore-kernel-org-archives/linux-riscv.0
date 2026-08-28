Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1155C61DD3
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLqDPmMJl28LF+ov7yzonMjAAuahho0Sm1+dHO5Y2FU=; b=tL+MuncMAh7knJ
	7q0ZtxtbuL+OGBbxrAKv1NRHtsvVIk9OwWqpdRlqtZzPHIpSgtHHQ+ZJ3sn9BKFCYryjDeg0aafpb
	cggtO9ian38jX9IycCcEgQ1Ec60hutXp0WfUCwFYugB/lFHgl48nsDzb3btmhOJkZi8aN+KSJ38Hz
	voW5JSiu4SyTuMphQsYrJcmUk4CPycAPps+nMtLX04D8V2mTQpAuOwpUSGgKZCMt1dqYKMgHAsZP1
	O5kXvsr9Bx4aOHKScmE6JEWja35o8Rz8deOJZYtTUiGd/891dKWkDTzYXG8kxwBlHNtVvLb4dM6GJ
	3BtWd2spjKIlHXcz82Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwxM-00000005sJj-2WLF;
	Fri, 28 Aug 2026 13:49:20 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwwa-00000005r8l-1NTg
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 13:48:33 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-396d27bb2beso781131a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787924911; x=1788529711; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ryt7yZmF0T0BLkRjL8DfW4WEGpGCHSG+s/XfPRWVBow=;
        b=E52kf0dS8n1G3HOn9SPBlPuO+GDwt7NBosiS6gS8LHcyI+WSVZ1oMK8NF0soZTr9Vt
         YeTiY1DDUNsLMjHBFa9YsZpe43a/wlfPTJPRULHraygSbLlPuwBwafvCU9tJUlN8DolC
         kFy15LhwgskVNJpJGrR3ipQj0t0FtCmY1zNbPMPirSRh88iwzXL86d+MlvzgkLEKy5H1
         oln1Ez5VjN83d3BN9OKbe+7tp6R2g51XvZtMp2ijN+z7Fx1H72eNME1BgaLYI73LhyCr
         04pH56WPVNlrTsi0vZKWoAF0DNsK9fiLdB00zmzkCMBRRGcVOjhzYI+0xl3zrpFK9QDK
         XPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924911; x=1788529711;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryt7yZmF0T0BLkRjL8DfW4WEGpGCHSG+s/XfPRWVBow=;
        b=G1ESVorqV+bXrV7fDt1UMFTVZWHaYtf+nvDzzmJtnqDRVjMa8qurHpmZKObIXGwMP6
         Yo9yqt+JTLihmh8dH3KuPE61VVjOnKtQtg897iBSQE/0Wyr7HP1Gk4ZRh0g0FxL4g0IW
         vkGZbjfjDtzdfeTmOsA8r9rgg1ZAgQOcOIeRlxPCXTzP7BcYBmuuyWDohjwj4BOUVo5I
         OcuJk4/SjOnGsRSdyB+R6aEYGZz34TEX8RjhlGWnPKi3WcOnjhtIycSwkkfWu9C2RDV4
         jLkH0uHUjvEPu2foc60ZkJeEiAE6TwiierqN7D/6KYsHX3LrVzpePQF03JOPZ8CpseQG
         t5Yg==
X-Forwarded-Encrypted: i=1; AHgh+RpzFPYlmaGPdJ+WPw/mtcvkVhgwNXWw0PFl2wnCY1ULKOKdrTrMOJTPikFyv5WKP8YKjYjyU/hVM+MdAg==@lists.infradead.org
X-Gm-Message-State: AFuF++nl0/+YGQ0vKlTFBAkXvseUn0VVn6LdlQ9ZB+4u0pA6dbXwfxNX
	tTpvqiAj0XWRdIMCpUAShlHyMzRY6UDNycRE2AOGqjYTl55N12aOFeD16xdndARbTzTYoQ==
X-Gm-Gg: AR+sD12rhzMb6wkp2UZ7po5vl4QE3as/dov1bes3WV35oxXZwP/VQvysd8kobsvLnK6
	f9a0DMSCvEj/asJ6JJhmBSEQlnkM6GEGywSGSib8XFTRzxM4ieFqxND3HVtTrSulPpc9D75qKdY
	I/E/mpzAKfKC+tlr5AZhrLCYLNxuwYa4AG7H+3TwtBGPX8HX28QY0V55RF7PbFORyM4EZVS3btM
	4YcWcRoolqnj9yAerYeOHGAxxtNBRduHLqqVzVcVsj6Csb6dWZxRM5u3jPyJfhOAdYV3bjRSRjK
	HON4ALRhkt+/Vhhms3QKADmecy2qzuhXOz5pfOkdAwtf5u/KJ5abxNp6LxChe0RoAPfVFhans4d
	TEu+9eCY6AJNi64az75ntA8gpSzDjNR2KAyDN2cOae64CcfMShp2X3dKdZFNlAnGXRgUztaZ7aq
	KwWHvB5c0vqUGtR8v24hktUI0sLFX2pw32WCXfbqhPiudYfJUsCv/KXbOjcvU0sUa6j2MdN6alr
	w6lrFzat8lbyQ==
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr1472296a91.10.1787924911385;
        Fri, 28 Aug 2026 06:48:31 -0700 (PDT)
Received: from hppc-archlinux.localnet ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm7340190a91.6.2026.08.28.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:48:30 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Fri, 28 Aug 2026 21:46:40 +0800
Message-ID: <RbJcKtULSuOq1gqhZCEqbA@gmail.com>
In-Reply-To: <apGIgyn-iJ534D9S@wyuan.org>
References: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
 <apGIgyn-iJ534D9S@wyuan.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_064832_381235_D97B541E 
X-CRM114-Status: GOOD (  22.94  )
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

SGkgV2VpamllLAoKT24gRnJpZGF5LCBBdWd1c3QgMjgsIDIwMjYgOTowOToyM+KAr1BNIENoaW5h
IFN0YW5kYXJkIFRpbWUgV2VpamllIFl1YW4gd3JvdGU6Cj4gSGkgWXVrYWksCj4gCj4gT24gRnJp
LCBBdWcgMjgsIDIwMjYgYXQgMDI6MTg6MTZQTSArMDgwMCwgWXVrYWkgV3Ugd3JvdGU6Cj4gPiBV
cGRhdGUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0IHRyYW5z
bGF0aW9uLgo+ID4gCj4gPiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGVk
ODQzYWU5NDdmOAo+ID4gKCJkb2NzOiBtb3ZlIHJpc2N2IHVuZGVyIGFyY2giKQo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZdWthaSBXdSA8eGlhb3lld3V6LlJ1c3RlckBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+IAo+ID4gIC4uLi96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0ICAg
ICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJz
dAo+ID4gYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3BhdGNo
LWFjY2VwdGFuY2UucnN0IGluZGV4Cj4gPiBjOGViMjMwY2E4ZWUuLmE0OGU2ZTU3NWE2NyAxMDA2
NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yv
cGF0Y2gtYWNjZXB0YW5jZS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QKPiA+IEBAIC0xNSwxOSArMTUs
NDEgQEAgYXJjaC9yaXNjdiDlvIDlj5HogIXnu7TmiqTmjIfljZcKPiA+IAo+ID4gIOamgui/sAo+
ID4gIC0tLS0KPiA+IAo+ID4gLVJJU0MtVuaMh+S7pOmbhuS9k+ezu+e7k+aehOaYr+WFrOW8gOW8
gOWPkeeahO+8mgo+ID4gK1JJU0MtViDmjIfku6Tpm4bkvZPns7vnu5PmnoTmmK/lhazlvIDlvIDl
j5HnmoTvvJoKPiA+IAo+ID4gIOato+WcqOi/m+ihjOeahOiNieahiOWPr+S+m+aJgOacieS6uuaf
peeci+WSjOa1i+ivleWunueOsOOAguaWsOaooeWdl+aIluiAheaJqeWxleiNieahiOWPr+iDveS8
muWcqOW8gOWPkei/h+eoi+S4reWPkQo+ID4gCj4gPiAt55Sf5pu05pS5LS0t5pyJ5pe25Lul5LiN
5YW85a6555qE5pa55byP5a+55Lul5YmN55qE6I2J5qGI6L+b6KGM5pu05pS544CC6L+Z56eN54G1
5rS75oCn5Y+v6IO95Lya57uZUklTQy1WIExpbnV4Cj4gPiAt57u05oqk6ICF5bim5p2l5oyR5oiY
44CCTGludXjlvIDlj5Hov4fnqIvmm7TllpzmrKLnu4/ov4foia/lpb3mo4Dmn6XlkozmtYvor5Xn
moTku6PnoIHvvIzogIzkuI3mmK/or5Xpqozku6PnoIHjgILmiJEKPiA+IC3ku6zluIzmnJvmjqjl
ub/lkIzmoLfnmoTop4TliJnliLDljbPlsIbooqvlhoXmoLjlkIjlubbnmoRSSVNDLVbnm7jlhbPk
u6PnoIHjgIIKPiA+ICvnlJ/mm7TmlLkgLS0tIOacieaXtuS7peS4jeWFvOWuueeahOaWueW8j+Wv
ueS7peWJjeeahOiNieahiOi/m+ihjOabtOaUueOAgui/meenjeeBtea0u+aAp+WPr+iDveS8mue7
mSBSSVNDLVYKPiA+ICtMaW51eCDnu7TmiqTogIXluKbmnaXmjJHmiJjjgIJMaW51eCDnu7TmiqTo
gIXkuI3otZ7miJDpopHnuYHnmoTlj5jmm7TvvIzkuJQgTGludXgg5byA5Y+R6L+H56iL5pu05Zac
5qyi57uP6L+HCj4gPiAr6Imv5aW95qOA5p+l5ZKM5rWL6K+V55qE5Luj56CB77yM6ICM5LiN5piv
6K+V6aqM5Luj56CB44CC5oiR5Lus5biM5pyb5o6o5bm/5ZCM5qC355qE6KeE5YiZ5Yiw5Y2z5bCG
6KKr5YaF5qC45ZCI5bm255qECj4gPiArUklTQy1WIOebuOWFs+S7o+eggeOAggo+ID4gCj4gPiAr
6KGl5LiB6Lef6Liq57O757ufCj4gPiArLS0tLS0tLS0tLS0tCj4gPiArCj4gPiArUklTQy1WIOac
ieS4gOS4quihpeS4gei3n+i4quezu+e7n+WunuS+i++8jOWPr+S7peWcqOmCo+mHjOafpeeci+ih
peS4geeahOeKtuaAge+8mgo+IAo+IEkgc3VnZ2VzdCBrZWVwaW5nIHRoZSBuYW1lICJQYXRjaHdv
cmsiIGFzIGlzLiBCZWNhdXNlIHdlIGRvbid0IHRyYW5zbGF0ZQo+IGl0IGluIG1vc3QgY2FzZXMu
Cj4gCgpBZ3JlZWQuIEkgd2lsbCBrZWVwIGl0IGluIHRoZSB2MiBwYXRjaC4KCj4gPiArCj4gPiAr
ICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8K
PiA+ICsKPiA+ICvlpoLmnpzkvaDnmoTooaXkuIHkuI3lnKjpu5jorqTop4blm77kuK3lh7rnjrDv
vIzpgqPkuYggUklTQy1WIOe7tOaKpOiAheW+iOacieWPr+iDveW3suimgeaxguS/ruaUue+8jOaI
luiAheW4jOacmwo+ID4gK+WwhuWFtuW6lOeUqOWIsOWPpuS4gOS4quS7o+eggeagkeS4iuOAggo+
ID4gKwo+ID4gK+iHquWKqOWMlua1geeoi+S8muWcqOivpeihpeS4gei3n+i4quezu+e7n+WunuS+
i+S4iui/kOihjO+8jOWcqOavj+S4quihpeS4geWIsOi+vuaXtueri+WIu+WvueWFtui/m+ihjOae
hOW7ui/mtYvor5XjgIIKPiA+ICvoh6rliqjljJbmtYHnqIvmoLnmja7ooaXkuIHmmK/lkKbooqvo
r4bliKvkuLrkv67lpI3vvIzlsIblhbblupTnlKjliLAgUklTQy1WIGBmb3ItbmV4dGAg5ZKMIGBm
aXhlc2Ag5YiG5pSvCj4gPiAr5b2T5YmN55qEIEhFQUQg5LiK44CC5aaC5p6c5Z2H5LiN6YCC55So
77yM5YiZ5Lya5L2/55SoIFJJU0MtViBgbWFzdGVyYCDliIbmlK/jgILooaXkuIHns7vliJfooqvl
upTnlKjliLDnmoTlhbcKPiA+ICvkvZPmj5DkuqTlsIbmoIfms6jlnKjooaXkuIHot5/ouKrns7vn
u5/kuIrjgILku7vkvZXmo4Dmn6XmnKrpgJrov4fnmoTooaXkuIHpgJrluLjkuI3kvJrooqvlupTn
lKjvvIzlubbkuJTlnKjlpKflpJrmlbDmg4UKPiA+ICvlhrXkuIvlsIbpnIDopoHph43mlrDmj5Dk
uqTjgIIKPiA+IAo+ID4gIOmZhOWKoOeahOaPkOS6pOajgOafpeWNlQo+ID4gIC0tLS0tLS0tLS0t
LS0tLS0KPiA+IAo+ID4gLeaIkeS7rOS7heaOpeWPl+ebuOWFs+agh+WHhuW3sue7j+iiq1JJU0Mt
VuWfuumHkeS8muagh+WHhuS4uuKAnOW3suaJueWHhuKAneaIluKAnOW3suWGu+e7k+KAneeahOaJ
qeWxleaIluaooeWdl+eahOihpeS4geOAggo+ID4gLe+8iOW8gOWPkeiAheW9k+eEtuWPr+S7pee7
tOaKpOiHquW3seeahExpbnV45YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5omA6ZyA5Luj56CB5omp
5bGV6I2J5qGI55qE5Luj56CB44CC77yJCj4gCj4gT3JpZ2luYWw6ICJGcm96ZW4iIG9yICJSYXRp
ZmllZCIgLS0gIuW3suWGu+e7kyLmiJYi5bey5om55YeGIgo+IAo+IEJ1dCBkb2VuJ3QgbWF0dGVy
IG11Y2guCj4gCgpVbmRlcnN0b29kLiBJIHdpbGwgY2hhbmdlIGl0LgoKPiA+IC0KPiA+IC3mraTl
pJbvvIxSSVNDLVbop4TojIPlhYHorrjniLHlpb3ogIXliJvlu7roh6rlt7HnmoToh6rlrprkuYnm
ianlsZXjgILov5nkupvoh6rlrprkuYnmi5PlsZXkuI3pnIDopoHpgJrov4dSSVNDLVYKPiA+IC3l
n7rph5HkvJrnmoTku7vkvZXlrqHmoLjmiJbmibnlh4bjgILkuLrkuobpgb/lhY3lsIbniLHlpb3o
gIXkuIDkupvnibnliKvnmoRSSVNDLVbmi5PlsZXmt7vliqDov5vlhoXmoLjku6PnoIHluKbmnaUK
PiA+IC3nmoTnu7TmiqTlpI3mnYLmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43vvIzmiJHk
u6zlsIblj6rmjqXlj5dSSVNDLVbln7rph5HkvJrmraPlvI/lhrvnu5PmiJbmibnlh4bnmoTnmoTm
ianlsZUKPiAKPiB3ZSdsbCBvbmx5IGNvbnNpZGVyIC0g5Y+q6ICD6JmR77yfCj4gCj4gVGhlIGNo
YW5nZSAoYWNjZXB0IC0+IGNvbnNpZGVyKSBpcyBpbiBjb21taXQgOTM2MTAwZDQ1MDdmCj4gKERv
Y3VtZW50YXRpb246IFJJU0MtVjogQWxsb3cgcGF0Y2hlcyBmb3Igbm9uLXN0YW5kYXJkIGJlaGF2
aW9yKQo+IAo+IERpZCB5b3UgbWlzcyBpdD8KPiAKClllcywgSSBtaXNzZWQgdGhhdC4gVGhhbmsg
eW91IGZvciBwb2ludGluZyBvdXQuIEkgd2lsbCBjb3JyZWN0IGl0IGluIHYyLgoKPiA+IC3ooaXk
uIHjgILvvIjlvIDlj5HogIXlvZPnhLblj6/ku6Xnu7TmiqToh6rlt7HnmoRMaW51eOWGheaguOag
ke+8jOWFtuS4reWMheWQq+S7luS7rOaDs+imgeeahOS7u+S9leiHquWumuS5ieaJqeWxlQo+ID4g
LeeahOS7o+eggeOAgu+8iQo+ID4gK+aIkeS7rOS7heaOpeWPl+mSiOWvueaWsOaooeWdl+aIluaJ
qeWxleeahOihpeS4ge+8jOWJjeaPkOaYr+i/meS6m+aooeWdl+aIluaJqeWxleeahOinhOiMg+ii
q+WIl+S4uuacquadpeS4jeWkquWPr+iDveWPkQo+ID4gK+eUn+S4jeWFvOWuueeahOWPmOabtOOA
guWvueS6juadpeiHqiBSSVNDLVYg5Z+66YeR5Lya55qE6KeE6IyD77yM6L+Z5oSP5ZGz552A4oCc
5bey5om55YeG4oCd5oiW4oCc5bey5Ya757uT4oCd77yM5a+55LqOCj4gPiArVUVGSSDorrrlnZvn
moTop4TojIPvvIzov5nmhI/lkbPnnYDlt7Llj5HluIPnmoQgRUNS44CC77yI5byA5Y+R6ICF5b2T
54S25Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jAo+ID4gK+WFtuS4reWM
heWQq+S7luS7rOaJgOmcgOeahOS7u+S9leaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQo+ID4g
Kwo+ID4gK+atpOWklu+8jFJJU0MtViDop4TojIPlhYHorrjlrp7njrDogIXliJvlu7roh6rlt7Hn
moToh6rlrprkuYnmianlsZXjgILov5nkupvoh6rlrprkuYnmianlsZXkuI3pnIDopoHpgJrov4cg
UklTQy1WCj4gPiAr5Z+66YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG5rWB56iL44CC5Li6
5LqG6YG/5YWN5Zug5re75Yqg5a6e546w6ICF54m55a6a55qEIFJJU0MtViDmianlsZXluKbmnaXn
moTnu7TmiqTlpI3mnYIKPiA+ICvmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43vvIzmiJHk
u6zlsIblj6rmjqXlj5fnrKblkIjku6XkuIvku7vkuIDmnaHku7bnmoTmianlsZXooaXkuIHvvJoK
PiA+ICsKPiA+ICstIOW3sueUsSBSSVNDLVYg5Z+66YeR5Lya5q2j5byP5Ya757uT5oiW5om55YeG
Cj4gPiArLSDlt7LmjInnhafmoIflh4YgTGludXgg5oOv5L6L77yM5Zyo5bm/5rOb5Y+v55So55qE
56Gs5Lu25Lit5a6e546wCj4gPiArCj4gPiAr77yI5a6e546w6ICF5b2T54S25Y+v5Lul57u05oqk
6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jOWFtuS4reWMheWQq+S7luS7rOaJgOmcgOeahOS7
u+S9leiHquWumuS5ieaJqeWxleeahOS7o+eggeOAgu+8iQo+IAo+IC0gUmV2aWV3cyBmcm9tIGNv
bW11bml0eSwgYmV0dGVyIHdhaXQgZm9yIHRoZSByZXBseSBmcm9tIG1haW50YWluZXJzLgo+IAo+
IFRoYW5rcy4KClRoYW5rcyBhZ2FpbiBmb3IgeW91ciB0aW1lIGFuZCByZXZpZXcuIEFuZCBzb3Jy
eSBmb3IgcmVhZGluZyB0aGUgb3JpZ2luYWwgCmRvY3VtZW50YXRpb24gbm90IHNvIGNhcmVmdWxs
eS4KCkJlc3QgcmVnYXJkcywKWXVrYWkgV3UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
