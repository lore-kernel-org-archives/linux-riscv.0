Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED53DC61DCB
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOxYNmb4NDJ8lUotIA0NZQt6l2yFqVw4U/Kokd+5IVI=; b=qsS8r2gWTF6tn+
	yrNL0AGGxgVe3acT9bziRirwKOv8zxkovzmeyXvUukJ6pG6Ov0NIB1gvwWAQGqKAohpXPz9s+YlcE
	hgsT2GB23TCYDygqiFC9a0SYRl4NsN7aEUX5/0fNbIKRLbKQMb3bZTnDfUcO8ELIPWTbcAzzcIcVc
	6MBk63t+aoNPmsJHxjmj6oeM+Y2xLapmacfzt1npp3St80idiGhzXuKdz3TB4NMd4flMZlYpFebWf
	cmCDL1eSGEZ4Zpg0f9+jSJg7voZcOdaWjgEseQad5SEpxio1ogLPvP9zAjCFX9MDM0n1KLITlYHoC
	izVFWsdkaHZFgHUA7HdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwKz-00000005nAf-0jj8;
	Fri, 28 Aug 2026 13:09:41 +0000
Received: from out-90.mta1.migadu.com ([2001:41d0:203:375::5a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwKv-00000005nA7-1nT2
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 13:09:39 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7Ajbzjj2AKFat2xyqRunplCt/lLNL3Ud/x2dLApOItE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787922573; v=1; x=1788527373;
 b=nfaeTn28epLyF82T+JBS6+N5DSFlT8CjZoGQD7xyZbfxmfXh+BqH9mxjc6KhEvN1EEyTcQE/
 /KkvbHOixtbaL3Ssu+AF9nybtptcKuRDK05fo0gO3ScSE9WDM9wsrvHZy9M0+OUDteCEP0aLgwv
 CTxdDx94lwkUdSHV/1wxBg8DbewC8Iy+ZIvMYURyRXxyf7lVuw7acPfR//ucLn+RGYiAuJ8zwFu
 bD3jzJlB7mhtHdpjtcxohZvo7MO0jvDIvRWt6+IQgWeoiFF/7DUidsgfE3c+5diszzPcs0ZDma9
 0qY3nhnhi2fo3LZ41traJtQkaJbkfIQD7noY+d5mD856g==
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a4483ccbc7d78e00;
	Fri, 28 Aug 2026 13:09:33 +0000
X-Mizu-Trace-ID: a4483ccbc7d78e00
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 21:09:23 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
Message-ID: <apGIgyn-iJ534D9S@wyuan.org>
References: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_060937_878848_84DF64BD 
X-CRM114-Status: GOOD (  14.69  )
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

SGkgWXVrYWksCgpPbiBGcmksIEF1ZyAyOCwgMjAyNiBhdCAwMjoxODoxNlBNICswODAwLCBZdWth
aSBXdSB3cm90ZToKPiBVcGRhdGUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2Vw
dGFuY2UucnN0IHRyYW5zbGF0aW9uLgo+IAo+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3Vn
aCBjb21taXQgZWQ4NDNhZTk0N2Y4Cj4gKCJkb2NzOiBtb3ZlIHJpc2N2IHVuZGVyIGFyY2giKQo+
IAo+IFNpZ25lZC1vZmYtYnk6IFl1a2FpIFd1IDx4aWFveWV3dXouUnVzdGVyQGdtYWlsLmNvbT4K
PiAtLS0KPiAgLi4uL3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QgICAgIHwg
NDYgKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0Cj4g
aW5kZXggYzhlYjIzMGNhOGVlLi5hNDhlNmU1NzVhNjcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gt
YWNjZXB0YW5jZS5yc3QKPiBAQCAtMTUsMTkgKzE1LDQxIEBAIGFyY2gvcmlzY3Yg5byA5Y+R6ICF
57u05oqk5oyH5Y2XCj4gIAo+ICDmpoLov7AKPiAgLS0tLQo+IC1SSVNDLVbmjIfku6Tpm4bkvZPn
s7vnu5PmnoTmmK/lhazlvIDlvIDlj5HnmoTvvJoKPiArUklTQy1WIOaMh+S7pOmbhuS9k+ezu+e7
k+aehOaYr+WFrOW8gOW8gOWPkeeahO+8mgo+ICDmraPlnKjov5vooYznmoTojYnmoYjlj6/kvpvm
iYDmnInkurrmn6XnnIvlkozmtYvor5Xlrp7njrDjgILmlrDmqKHlnZfmiJbogIXmianlsZXojYnm
oYjlj6/og73kvJrlnKjlvIDlj5Hov4fnqIvkuK3lj5EKPiAt55Sf5pu05pS5LS0t5pyJ5pe25Lul
5LiN5YW85a6555qE5pa55byP5a+55Lul5YmN55qE6I2J5qGI6L+b6KGM5pu05pS544CC6L+Z56eN
54G15rS75oCn5Y+v6IO95Lya57uZUklTQy1WIExpbnV4Cj4gLee7tOaKpOiAheW4puadpeaMkeaI
mOOAgkxpbnV45byA5Y+R6L+H56iL5pu05Zac5qyi57uP6L+H6Imv5aW95qOA5p+l5ZKM5rWL6K+V
55qE5Luj56CB77yM6ICM5LiN5piv6K+V6aqM5Luj56CB44CC5oiRCj4gLeS7rOW4jOacm+aOqOW5
v+WQjOagt+eahOinhOWImeWIsOWNs+Wwhuiiq+WGheaguOWQiOW5tueahFJJU0MtVuebuOWFs+S7
o+eggeOAggo+ICvnlJ/mm7TmlLkgLS0tIOacieaXtuS7peS4jeWFvOWuueeahOaWueW8j+WvueS7
peWJjeeahOiNieahiOi/m+ihjOabtOaUueOAgui/meenjeeBtea0u+aAp+WPr+iDveS8mue7mSBS
SVNDLVYKPiArTGludXgg57u05oqk6ICF5bim5p2l5oyR5oiY44CCTGludXgg57u05oqk6ICF5LiN
6LWe5oiQ6aKR57mB55qE5Y+Y5pu077yM5LiUIExpbnV4IOW8gOWPkei/h+eoi+abtOWWnOasoue7
j+i/hwo+ICvoia/lpb3mo4Dmn6XlkozmtYvor5XnmoTku6PnoIHvvIzogIzkuI3mmK/or5Xpqozk
u6PnoIHjgILmiJHku6zluIzmnJvmjqjlub/lkIzmoLfnmoTop4TliJnliLDljbPlsIbooqvlhoXm
oLjlkIjlubbnmoQKPiArUklTQy1WIOebuOWFs+S7o+eggeOAggoKPiAr6KGl5LiB6Lef6Liq57O7
57ufCj4gKy0tLS0tLS0tLS0tLQo+ICsKPiArUklTQy1WIOacieS4gOS4quihpeS4gei3n+i4quez
u+e7n+WunuS+i++8jOWPr+S7peWcqOmCo+mHjOafpeeci+ihpeS4geeahOeKtuaAge+8mgoKSSBz
dWdnZXN0IGtlZXBpbmcgdGhlIG5hbWUgIlBhdGNod29yayIgYXMgaXMuIEJlY2F1c2Ugd2UgZG9u
J3QgdHJhbnNsYXRlCml0IGluIG1vc3QgY2FzZXMuCgo+ICsKPiArICBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8KPiArCj4gK+WmguaenOS9oOea
hOihpeS4geS4jeWcqOm7mOiupOinhuWbvuS4reWHuueOsO+8jOmCo+S5iCBSSVNDLVYg57u05oqk
6ICF5b6I5pyJ5Y+v6IO95bey6KaB5rGC5L+u5pS577yM5oiW6ICF5biM5pybCj4gK+WwhuWFtuW6
lOeUqOWIsOWPpuS4gOS4quS7o+eggeagkeS4iuOAggo+ICsKPiAr6Ieq5Yqo5YyW5rWB56iL5Lya
5Zyo6K+l6KGl5LiB6Lef6Liq57O757uf5a6e5L6L5LiK6L+Q6KGM77yM5Zyo5q+P5Liq6KGl5LiB
5Yiw6L6+5pe256uL5Yi75a+55YW26L+b6KGM5p6E5bu6L+a1i+ivleOAggo+ICvoh6rliqjljJbm
tYHnqIvmoLnmja7ooaXkuIHmmK/lkKbooqvor4bliKvkuLrkv67lpI3vvIzlsIblhbblupTnlKjl
iLAgUklTQy1WIGBmb3ItbmV4dGAg5ZKMIGBmaXhlc2Ag5YiG5pSvCj4gK+W9k+WJjeeahCBIRUFE
IOS4iuOAguWmguaenOWdh+S4jemAgueUqO+8jOWImeS8muS9v+eUqCBSSVNDLVYgYG1hc3RlcmAg
5YiG5pSv44CC6KGl5LiB57O75YiX6KKr5bqU55So5Yiw55qE5YW3Cj4gK+S9k+aPkOS6pOWwhuag
h+azqOWcqOihpeS4gei3n+i4quezu+e7n+S4iuOAguS7u+S9leajgOafpeacqumAmui/h+eahOih
peS4gemAmuW4uOS4jeS8muiiq+W6lOeUqO+8jOW5tuS4lOWcqOWkp+WkmuaVsOaDhQo+ICvlhrXk
uIvlsIbpnIDopoHph43mlrDmj5DkuqTjgIIKPiAgCj4gIOmZhOWKoOeahOaPkOS6pOajgOafpeWN
lQo+ICAtLS0tLS0tLS0tLS0tLS0tCj4gLeaIkeS7rOS7heaOpeWPl+ebuOWFs+agh+WHhuW3sue7
j+iiq1JJU0MtVuWfuumHkeS8muagh+WHhuS4uuKAnOW3suaJueWHhuKAneaIluKAnOW3suWGu+e7
k+KAneeahOaJqeWxleaIluaooeWdl+eahOihpeS4geOAggo+IC3vvIjlvIDlj5HogIXlvZPnhLbl
j6/ku6Xnu7TmiqToh6rlt7HnmoRMaW51eOWGheaguOagke+8jOWFtuS4reWMheWQq+aJgOmcgOS7
o+eggeaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQoKT3JpZ2luYWw6ICJGcm96ZW4iIG9yICJS
YXRpZmllZCIgLS0gIuW3suWGu+e7kyLmiJYi5bey5om55YeGIgoKQnV0IGRvZW4ndCBtYXR0ZXIg
bXVjaC4KCj4gLQo+IC3mraTlpJbvvIxSSVNDLVbop4TojIPlhYHorrjniLHlpb3ogIXliJvlu7ro
h6rlt7HnmoToh6rlrprkuYnmianlsZXjgILov5nkupvoh6rlrprkuYnmi5PlsZXkuI3pnIDopoHp
gJrov4dSSVNDLVYKPiAt5Z+66YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG44CC5Li65LqG
6YG/5YWN5bCG54ix5aW96ICF5LiA5Lqb54m55Yir55qEUklTQy1W5ouT5bGV5re75Yqg6L+b5YaF
5qC45Luj56CB5bim5p2lCj4gLeeahOe7tOaKpOWkjeadguaAp+WSjOWvueaAp+iDveeahOa9nOWc
qOW9seWTje+8jOaIkeS7rOWwhuWPquaOpeWPl1JJU0MtVuWfuumHkeS8muato+W8j+WGu+e7k+aI
luaJueWHhueahOeahOaJqeWxlQoKd2UnbGwgb25seSBjb25zaWRlciAtIOWPquiAg+iZke+8nwoK
VGhlIGNoYW5nZSAoYWNjZXB0IC0+IGNvbnNpZGVyKSBpcyBpbiBjb21taXQgOTM2MTAwZDQ1MDdm
CihEb2N1bWVudGF0aW9uOiBSSVNDLVY6IEFsbG93IHBhdGNoZXMgZm9yIG5vbi1zdGFuZGFyZCBi
ZWhhdmlvcikKCkRpZCB5b3UgbWlzcyBpdD8KCj4gLeihpeS4geOAgu+8iOW8gOWPkeiAheW9k+eE
tuWPr+S7pee7tOaKpOiHquW3seeahExpbnV45YaF5qC45qCR77yM5YW25Lit5YyF5ZCr5LuW5Lus
5oOz6KaB55qE5Lu75L2V6Ieq5a6a5LmJ5omp5bGVCj4gLeeahOS7o+eggeOAgu+8iQo+ICvmiJHk
u6zku4XmjqXlj5fpkojlr7nmlrDmqKHlnZfmiJbmianlsZXnmoTooaXkuIHvvIzliY3mj5DmmK/o
v5nkupvmqKHlnZfmiJbmianlsZXnmoTop4TojIPooqvliJfkuLrmnKrmnaXkuI3lpKrlj6/og73l
j5EKPiAr55Sf5LiN5YW85a6555qE5Y+Y5pu044CC5a+55LqO5p2l6IeqIFJJU0MtViDln7rph5Hk
vJrnmoTop4TojIPvvIzov5nmhI/lkbPnnYDigJzlt7Lmibnlh4bigJ3miJbigJzlt7Llhrvnu5Pi
gJ3vvIzlr7nkuo4KPiArVUVGSSDorrrlnZvnmoTop4TojIPvvIzov5nmhI/lkbPnnYDlt7Llj5Hl
uIPnmoQgRUNS44CC77yI5byA5Y+R6ICF5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4
IOWGheaguOagke+8jAo+ICvlhbbkuK3ljIXlkKvku5bku6zmiYDpnIDnmoTku7vkvZXmianlsZXo
jYnmoYjnmoTku6PnoIHjgILvvIkKPiArCj4gK+atpOWklu+8jFJJU0MtViDop4TojIPlhYHorrjl
rp7njrDogIXliJvlu7roh6rlt7HnmoToh6rlrprkuYnmianlsZXjgILov5nkupvoh6rlrprkuYnm
ianlsZXkuI3pnIDopoHpgJrov4cgUklTQy1WCj4gK+WfuumHkeS8mueahOS7u+S9leWuoeaguOaI
luaJueWHhua1geeoi+OAguS4uuS6humBv+WFjeWboOa3u+WKoOWunueOsOiAheeJueWumueahCBS
SVNDLVYg5omp5bGV5bim5p2l55qE57u05oqk5aSN5p2CCj4gK+aAp+WSjOWvueaAp+iDveeahOa9
nOWcqOW9seWTje+8jOaIkeS7rOWwhuWPquaOpeWPl+espuWQiOS7peS4i+S7u+S4gOadoeS7tuea
hOaJqeWxleihpeS4ge+8mgo+ICsKPiArLSDlt7LnlLEgUklTQy1WIOWfuumHkeS8muato+W8j+WG
u+e7k+aIluaJueWHhgo+ICstIOW3suaMieeFp+agh+WHhiBMaW51eCDmg6/kvovvvIzlnKjlub/m
s5vlj6/nlKjnmoTnoazku7bkuK3lrp7njrAKPiArCj4gK++8iOWunueOsOiAheW9k+eEtuWPr+S7
pee7tOaKpOiHquW3seeahCBMaW51eCDlhoXmoLjmoJHvvIzlhbbkuK3ljIXlkKvku5bku6zmiYDp
nIDnmoTku7vkvZXoh6rlrprkuYnmianlsZXnmoTku6PnoIHjgILvvIkKCi0gUmV2aWV3cyBmcm9t
IGNvbW11bml0eSwgYmV0dGVyIHdhaXQgZm9yIHRoZSByZXBseSBmcm9tIG1haW50YWluZXJzLgoK
VGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
