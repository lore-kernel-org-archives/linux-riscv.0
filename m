Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F654C61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 06:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QquSrWJ9cSeQ/DXWD+3DeUJXZv4lT1dBPTy+uxy2nfc=; b=I1FZhuIMyLgptC
	mXUmAq+CNxJw8QOELB24CSUvr1p75xJpOyumZbRLv8CXz75WWJXHL896uskwFDJkEOTm332H+AtRb
	pO/M1xNaH+yexTzTSZcI4pteR/4UcPEZBdKRUudHrIYmIZOdy7VfUuxquZcQFVdFYXWl8/gcAp6zu
	iWFFYJNr8NKlsMWnjsyFlQHI2+3ZI7irm1I8ysNStJH5HYBxeHi4tTwnPWy9FtyleXk9BCSrAUXZB
	auwvNHJ95czuSTJktD6eroG+Dub+AQO4v3ZiXWaQjJxAOf9jOssQddPrEbRV6tel/Jn2b+fCQBkFW
	VWLKFBff5Ggj8/n1G+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpvh-00000005CFR-2JFL;
	Fri, 28 Aug 2026 06:19:09 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpvf-00000005CEu-1JoO
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 06:19:08 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so339581a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897946; x=1788502746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfXDbSO38Ptv6nH8Zob9j+EEhcpNi44GPPmIo9LLCpU=;
        b=LpOeVZ6Ao3X3H/xgKGePfn1C/b3JO4F3bT7LhAF4W2KaqxJYqV4pAL+U4IOJOcY+OS
         4s2oE5BwSLRgo3yvPzVuFjsbo+IqUeTTVXT36z908F+FisNd8n9tpC/n2O+FD9TDmIsJ
         Y54GMTVE/HO+jTwBpaTy0wY21ddZ3aXG05febJoLHcvYSfcJoXV6xqvBfbRSlN/QhMOh
         E28dXwDdHHfOiRQVN3+3yF1wmrX2Swvap3GbR7YXRCIzWzYR5q0mZvuaGY8nG51yLI5Y
         qCrwbE44bGOOS3ZEF9mcJTuTb/bpnrymJ+jzpsxvHznUAn+eLp/IIChUCUGWPVbjvQi1
         gdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897946; x=1788502746;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfXDbSO38Ptv6nH8Zob9j+EEhcpNi44GPPmIo9LLCpU=;
        b=esncEBFs4lvVkXzRtWaw3CoL8cW4S1B3iw+rLyPrkhXvucDxxZEBZ4KX2ftQw3EcC9
         rVeZ8NviTyD3KPFRwp5to1pS1g03P/3izb0VDP4wmL7d6r/n/3oTJ3haRJPRa6ExZmGX
         LO45gZwwKjJSdjKAUsXFDJjhx5MiMAMzm/aNb/e+ls/s0MCjvHNPak9OqYjEDj8AgCFT
         glbkUoIA3nWf/hlpTGAW6UiqERBVWaFwqwC7xbBnc8dVjnQy8E800ICSIxAe/OcfIlSI
         pLeZ823oB/EFdgqOyyc5rP60Y9w1ssyFLXc10EeeXoSZq+a+0DtJdppMJEBCiuzXhkXb
         6Czg==
X-Forwarded-Encrypted: i=1; AHgh+RqqlQ2mqD9ffXElPkTOKSEVSsIMOLcWmab2HjGLwG8euEO/m+9iTGnNv9aU1YhYd8/Hbx9FpxuCWSkb6w==@lists.infradead.org
X-Gm-Message-State: AFuF++mYpDlKqIpswcGEERI+Gq+JRxFu8yPDLvrNBRfD0d0fXO8DKmii
	7AhBz/WCj2jbd08W5GStbDTl5h6SemzL/QtW1l36zF6y3NQAzbe62Ep8OYs6YYCOL7GQ2vDZ
X-Gm-Gg: AR+sD128DF+70R3exXHx7em5UgSx0VFbIbksPNjqZXKFnop2brd7icIPWbU5c/LLmGc
	vOPnEmoI2tdP0mvjaKSsbl89dBlSkbHJbNDz8OUl9KLgnoXcajnuxJeNzsGa0KjRe5/CW2wCaw1
	ikvWFiNI+j6UTiy4uMHYULz280EhMRJDNm4jss8bt6lNXFsFuU/YG3AQNcKE4rmcku4ge46z1Pt
	U3hJWztP2C+a4j6TafG4sMIFd7RwkXVBv4xNXterUHy+LT+aztmCoMvJW3KWikJKA9boTXYZ/g2
	kdvFMdaCTKziHih52+B2/ry65W/ZfSnz7Fvm40ifXd2UPmt5MF20LiSgTIA5JwThuT0dmA0xh5F
	Vt6vPV+nqloLB+WGmXzZ9X9bHxh/KMYflY/34D6jh6aiOMq6Zwjkkbd1juYsVm7tpsdeZSX3iFo
	HmUeeHcjSiIHKN4KG3PHtDbWw1pfeNG0OekoEwWSPBgiXF/x4/g/zjiOmPkc7R+xV9rsqPjJka7
	w==
X-Received: by 2002:a05:6a00:1149:b0:851:804c:f4eb with SMTP id d2e1a72fcca58-8562868f342mr8607621b3a.4.1787897946171;
        Thu, 27 Aug 2026 23:19:06 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fc7ab4asm256010b3a.22.2026.08.27.23.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:19:05 -0700 (PDT)
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
Subject: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Fri, 28 Aug 2026 14:18:16 +0800
Message-ID: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_231907_373719_D40DD779 
X-CRM114-Status: UNSURE (   8.17  )
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
IFd1IDx4aWFveWV3dXouUnVzdGVyQGdtYWlsLmNvbT4KLS0tCiAuLi4vemhfQ04vYXJjaC9yaXNj
di9wYXRjaC1hY2NlcHRhbmNlLnJzdCAgICAgfCA0NiArKysrKysrKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2Nl
cHRhbmNlLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3Yv
cGF0Y2gtYWNjZXB0YW5jZS5yc3QKaW5kZXggYzhlYjIzMGNhOGVlLi5hNDhlNmU1NzVhNjcgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3YvcGF0
Y2gtYWNjZXB0YW5jZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
YXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdApAQCAtMTUsMTkgKzE1LDQxIEBAIGFyY2gv
cmlzY3Yg5byA5Y+R6ICF57u05oqk5oyH5Y2XCiAKIOamgui/sAogLS0tLQotUklTQy1W5oyH5Luk
6ZuG5L2T57O757uT5p6E5piv5YWs5byA5byA5Y+R55qE77yaCitSSVNDLVYg5oyH5Luk6ZuG5L2T
57O757uT5p6E5piv5YWs5byA5byA5Y+R55qE77yaCiDmraPlnKjov5vooYznmoTojYnmoYjlj6/k
vpvmiYDmnInkurrmn6XnnIvlkozmtYvor5Xlrp7njrDjgILmlrDmqKHlnZfmiJbogIXmianlsZXo
jYnmoYjlj6/og73kvJrlnKjlvIDlj5Hov4fnqIvkuK3lj5EKLeeUn+abtOaUuS0tLeacieaXtuS7
peS4jeWFvOWuueeahOaWueW8j+WvueS7peWJjeeahOiNieahiOi/m+ihjOabtOaUueOAgui/meen
jeeBtea0u+aAp+WPr+iDveS8mue7mVJJU0MtViBMaW51eAot57u05oqk6ICF5bim5p2l5oyR5oiY
44CCTGludXjlvIDlj5Hov4fnqIvmm7TllpzmrKLnu4/ov4foia/lpb3mo4Dmn6XlkozmtYvor5Xn
moTku6PnoIHvvIzogIzkuI3mmK/or5Xpqozku6PnoIHjgILmiJEKLeS7rOW4jOacm+aOqOW5v+WQ
jOagt+eahOinhOWImeWIsOWNs+Wwhuiiq+WGheaguOWQiOW5tueahFJJU0MtVuebuOWFs+S7o+eg
geOAggor55Sf5pu05pS5IC0tLSDmnInml7bku6XkuI3lhbzlrrnnmoTmlrnlvI/lr7nku6XliY3n
moTojYnmoYjov5vooYzmm7TmlLnjgILov5nnp43ngbXmtLvmgKflj6/og73kvJrnu5kgUklTQy1W
CitMaW51eCDnu7TmiqTogIXluKbmnaXmjJHmiJjjgIJMaW51eCDnu7TmiqTogIXkuI3otZ7miJDp
opHnuYHnmoTlj5jmm7TvvIzkuJQgTGludXgg5byA5Y+R6L+H56iL5pu05Zac5qyi57uP6L+HCivo
ia/lpb3mo4Dmn6XlkozmtYvor5XnmoTku6PnoIHvvIzogIzkuI3mmK/or5Xpqozku6PnoIHjgILm
iJHku6zluIzmnJvmjqjlub/lkIzmoLfnmoTop4TliJnliLDljbPlsIbooqvlhoXmoLjlkIjlubbn
moQKK1JJU0MtViDnm7jlhbPku6PnoIHjgIIKKwor6KGl5LiB6Lef6Liq57O757ufCistLS0tLS0t
LS0tLS0KKworUklTQy1WIOacieS4gOS4quihpeS4gei3n+i4quezu+e7n+WunuS+i++8jOWPr+S7
peWcqOmCo+mHjOafpeeci+ihpeS4geeahOeKtuaAge+8mgorCisgIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0LworCivlpoLmnpzkvaDnmoTooaXk
uIHkuI3lnKjpu5jorqTop4blm77kuK3lh7rnjrDvvIzpgqPkuYggUklTQy1WIOe7tOaKpOiAheW+
iOacieWPr+iDveW3suimgeaxguS/ruaUue+8jOaIluiAheW4jOacmwor5bCG5YW25bqU55So5Yiw
5Y+m5LiA5Liq5Luj56CB5qCR5LiK44CCCisKK+iHquWKqOWMlua1geeoi+S8muWcqOivpeihpeS4
gei3n+i4quezu+e7n+WunuS+i+S4iui/kOihjO+8jOWcqOavj+S4quihpeS4geWIsOi+vuaXtuer
i+WIu+WvueWFtui/m+ihjOaehOW7ui/mtYvor5XjgIIKK+iHquWKqOWMlua1geeoi+agueaNruih
peS4geaYr+WQpuiiq+ivhuWIq+S4uuS/ruWkje+8jOWwhuWFtuW6lOeUqOWIsCBSSVNDLVYgYGZv
ci1uZXh0YCDlkowgYGZpeGVzYCDliIbmlK8KK+W9k+WJjeeahCBIRUFEIOS4iuOAguWmguaenOWd
h+S4jemAgueUqO+8jOWImeS8muS9v+eUqCBSSVNDLVYgYG1hc3RlcmAg5YiG5pSv44CC6KGl5LiB
57O75YiX6KKr5bqU55So5Yiw55qE5YW3CivkvZPmj5DkuqTlsIbmoIfms6jlnKjooaXkuIHot5/o
uKrns7vnu5/kuIrjgILku7vkvZXmo4Dmn6XmnKrpgJrov4fnmoTooaXkuIHpgJrluLjkuI3kvJro
oqvlupTnlKjvvIzlubbkuJTlnKjlpKflpJrmlbDmg4UKK+WGteS4i+WwhumcgOimgemHjeaWsOaP
kOS6pOOAggogCiDpmYTliqDnmoTmj5DkuqTmo4Dmn6XljZUKIC0tLS0tLS0tLS0tLS0tLS0KLeaI
keS7rOS7heaOpeWPl+ebuOWFs+agh+WHhuW3sue7j+iiq1JJU0MtVuWfuumHkeS8muagh+WHhuS4
uuKAnOW3suaJueWHhuKAneaIluKAnOW3suWGu+e7k+KAneeahOaJqeWxleaIluaooeWdl+eahOih
peS4geOAggot77yI5byA5Y+R6ICF5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qETGludXjlhoXm
oLjmoJHvvIzlhbbkuK3ljIXlkKvmiYDpnIDku6PnoIHmianlsZXojYnmoYjnmoTku6PnoIHjgILv
vIkKLQot5q2k5aSW77yMUklTQy1W6KeE6IyD5YWB6K6454ix5aW96ICF5Yib5bu66Ieq5bex55qE
6Ieq5a6a5LmJ5omp5bGV44CC6L+Z5Lqb6Ieq5a6a5LmJ5ouT5bGV5LiN6ZyA6KaB6YCa6L+HUklT
Qy1WCi3ln7rph5HkvJrnmoTku7vkvZXlrqHmoLjmiJbmibnlh4bjgILkuLrkuobpgb/lhY3lsIbn
iLHlpb3ogIXkuIDkupvnibnliKvnmoRSSVNDLVbmi5PlsZXmt7vliqDov5vlhoXmoLjku6PnoIHl
uKbmnaUKLeeahOe7tOaKpOWkjeadguaAp+WSjOWvueaAp+iDveeahOa9nOWcqOW9seWTje+8jOaI
keS7rOWwhuWPquaOpeWPl1JJU0MtVuWfuumHkeS8muato+W8j+WGu+e7k+aIluaJueWHhueahOea
hOaJqeWxlQot6KGl5LiB44CC77yI5byA5Y+R6ICF5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qE
TGludXjlhoXmoLjmoJHvvIzlhbbkuK3ljIXlkKvku5bku6zmg7PopoHnmoTku7vkvZXoh6rlrprk
uYnmianlsZUKLeeahOS7o+eggeOAgu+8iQor5oiR5Lus5LuF5o6l5Y+X6ZKI5a+55paw5qih5Z2X
5oiW5omp5bGV55qE6KGl5LiB77yM5YmN5o+Q5piv6L+Z5Lqb5qih5Z2X5oiW5omp5bGV55qE6KeE
6IyD6KKr5YiX5Li65pyq5p2l5LiN5aSq5Y+v6IO95Y+RCivnlJ/kuI3lhbzlrrnnmoTlj5jmm7Tj
gILlr7nkuo7mnaXoh6ogUklTQy1WIOWfuumHkeS8mueahOinhOiMg++8jOi/meaEj+WRs+edgOKA
nOW3suaJueWHhuKAneaIluKAnOW3suWGu+e7k+KAne+8jOWvueS6jgorVUVGSSDorrrlnZvnmoTo
p4TojIPvvIzov5nmhI/lkbPnnYDlt7Llj5HluIPnmoQgRUNS44CC77yI5byA5Y+R6ICF5b2T54S2
5Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8jAor5YW25Lit5YyF5ZCr5LuW
5Lus5omA6ZyA55qE5Lu75L2V5omp5bGV6I2J5qGI55qE5Luj56CB44CC77yJCisKK+atpOWklu+8
jFJJU0MtViDop4TojIPlhYHorrjlrp7njrDogIXliJvlu7roh6rlt7HnmoToh6rlrprkuYnmianl
sZXjgILov5nkupvoh6rlrprkuYnmianlsZXkuI3pnIDopoHpgJrov4cgUklTQy1WCivln7rph5Hk
vJrnmoTku7vkvZXlrqHmoLjmiJbmibnlh4bmtYHnqIvjgILkuLrkuobpgb/lhY3lm6Dmt7vliqDl
rp7njrDogIXnibnlrprnmoQgUklTQy1WIOaJqeWxleW4puadpeeahOe7tOaKpOWkjeadggor5oCn
5ZKM5a+55oCn6IO955qE5r2c5Zyo5b2x5ZON77yM5oiR5Lus5bCG5Y+q5o6l5Y+X56ym5ZCI5Lul
5LiL5Lu75LiA5p2h5Lu255qE5omp5bGV6KGl5LiB77yaCisKKy0g5bey55SxIFJJU0MtViDln7rp
h5HkvJrmraPlvI/lhrvnu5PmiJbmibnlh4YKKy0g5bey5oyJ54Wn5qCH5YeGIExpbnV4IOaDr+S+
i++8jOWcqOW5v+azm+WPr+eUqOeahOehrOS7tuS4reWunueOsAorCivvvIjlrp7njrDogIXlvZPn
hLblj6/ku6Xnu7TmiqToh6rlt7HnmoQgTGludXgg5YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5LuW
5Lus5omA6ZyA55qE5Lu75L2V6Ieq5a6a5LmJ5omp5bGV55qE5Luj56CB44CC77yJCi0tIAoyLjU1
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
