Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC148C61DB9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOPmvZ1WfUqmHA7DokgmFK/qJZreASkTMH8JBSNF9Pg=; b=GxZW8zEyPNHqUd
	t+I6K5sUA6vLHvXjxD/5/Oskd8dlDYEpniay2tSWrUpVbgZeFfbW0zdz3sK08uWU+IocrGi1sudcT
	hlOepvz1VcwXf4a/ZpM3xiHPHSamRepcwOR7psjMKKhNl/lxkD357lePK+lTkMeEEYEk+Uio1Ssgs
	O8G7X0p93MDzeliEvyzuv5BtgcduD/OUZtZnUXJI3RpXOQzJZrbGtG7xMGrAbU03aaOA57puVRJyT
	ZLkTVC08zzj9yeYNeqnQ7Wx+gGbQEHeXm8hdohOZpvYee0n7FV+SBufFwuBON5EIGgmIH+uXTFuMr
	N3rebFYK75JHGVKLjvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x09GX-00000006cYh-3uR7;
	Sat, 29 Aug 2026 02:57:57 +0000
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x09GT-00000006cY0-2gw7
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 02:57:56 +0000
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCmLE6lSpJqiKEKAA--.8013S2;
	Sat, 29 Aug 2026 10:57:41 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnRKGhSpJqOoYrAA--.39705S2;
	Sat, 29 Aug 2026 10:57:39 +0800 (CST)
Message-ID: <8490cbf8-0514-40a0-8456-d6a1085c29f0@hust.edu.cn>
Date: Sat, 29 Aug 2026 10:57:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
X-CM-TRANSID: IQEQrMCmLE6lSpJqiKEKAA--.8013S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1fAFW7Zr4kZF47CF1rWFg_yoW7WrWrpr
	ZFgF9aqFn29r1UKa4xKr1UJFW8ZFsxWFZI934DA3s3tr4kJrWIgayDJ3srCF1ag3s3Zry0
	va4kuFy8Ca47A3JanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_195753_870116_7A516B75 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDgvMjkvMjYgMTA6MjMgQU0sIFl1a2FpIFd1IHdyb3RlOgo+IFVwZGF0ZSBEb2N1bWVudGF0
aW9uL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QgdHJhbnNsYXRpb24uCj4KPiBVcGRh
dGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGVkODQzYWU5NDdmOAo+ICgiZG9jczog
bW92ZSByaXNjdiB1bmRlciBhcmNoIikKPgo+IFNpZ25lZC1vZmYtYnk6IFl1a2FpIFd1IDx4aWFv
eWV3dXouUnVzdGVyQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IERvbmdsaWFuZyBNdSA8ZHptOTFA
aHVzdC5lZHUuY24+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgIC0gQ2hhbmdlZCAi6KGl5LiB
6Lef6Liq57O757ufIiB0byAiUGF0Y2h3b3JrIi4KPiAgIC0gQ29ycmVjdGVkIGJyYW5jaCBzZWxl
Y3Rpb24gdG8gImZvci1uZXh0IOaIliBmaXhlcyIgKHdhcyAi5ZKMIikuCj4gICAtIEFkanVzdGVk
ICLlt7Lmibnlh4YiIG9yICLlt7Llhrvnu5MiIG9yZGVyLgo+ICAgLSBDaGFuZ2VkICLlj6rmjqXl
j5ciIHRvICLlj6rogIPomZEiLgo+ICAgLi4uL3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0
YW5jZS5yc3QgICAgIHwgNDYgKysrKysrKysrKysrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDM0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FyY2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3BhdGNoLWFj
Y2VwdGFuY2UucnN0Cj4gaW5kZXggYzhlYjIzMGNhOGVlLi4yMGI5MWQwNDMzYTkgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi9wYXRjaC1h
Y2NlcHRhbmNlLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Fy
Y2gvcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZS5yc3QKPiBAQCAtMTUsMTkgKzE1LDQxIEBAIGFyY2gv
cmlzY3Yg5byA5Y+R6ICF57u05oqk5oyH5Y2XCj4gICAKPiAgIOamgui/sAo+ICAgLS0tLQo+IC1S
SVNDLVbmjIfku6Tpm4bkvZPns7vnu5PmnoTmmK/lhazlvIDlvIDlj5HnmoTvvJoKPiArUklTQy1W
IOaMh+S7pOmbhuS9k+ezu+e7k+aehOaYr+WFrOW8gOW8gOWPkeeahO+8mgo+ICAg5q2j5Zyo6L+b
6KGM55qE6I2J5qGI5Y+v5L6b5omA5pyJ5Lq65p+l55yL5ZKM5rWL6K+V5a6e546w44CC5paw5qih
5Z2X5oiW6ICF5omp5bGV6I2J5qGI5Y+v6IO95Lya5Zyo5byA5Y+R6L+H56iL5Lit5Y+RCj4gLeeU
n+abtOaUuS0tLeacieaXtuS7peS4jeWFvOWuueeahOaWueW8j+WvueS7peWJjeeahOiNieahiOi/
m+ihjOabtOaUueOAgui/meenjeeBtea0u+aAp+WPr+iDveS8mue7mVJJU0MtViBMaW51eAo+IC3n
u7TmiqTogIXluKbmnaXmjJHmiJjjgIJMaW51eOW8gOWPkei/h+eoi+abtOWWnOasoue7j+i/h+iJ
r+WlveajgOafpeWSjOa1i+ivleeahOS7o+egge+8jOiAjOS4jeaYr+ivlemqjOS7o+eggeOAguaI
kQo+IC3ku6zluIzmnJvmjqjlub/lkIzmoLfnmoTop4TliJnliLDljbPlsIbooqvlhoXmoLjlkIjl
ubbnmoRSSVNDLVbnm7jlhbPku6PnoIHjgIIKPiAr55Sf5pu05pS5IC0tLSDmnInml7bku6XkuI3l
hbzlrrnnmoTmlrnlvI/lr7nku6XliY3nmoTojYnmoYjov5vooYzmm7TmlLnjgILov5nnp43ngbXm
tLvmgKflj6/og73kvJrnu5kgUklTQy1WCj4gK0xpbnV4IOe7tOaKpOiAheW4puadpeaMkeaImOOA
gkxpbnV4IOe7tOaKpOiAheS4jei1nuaIkOmikee5geeahOWPmOabtO+8jOS4lCBMaW51eCDlvIDl
j5Hov4fnqIvmm7TllpzmrKLnu4/ov4cKPiAr6Imv5aW95qOA5p+l5ZKM5rWL6K+V55qE5Luj56CB
77yM6ICM5LiN5piv6K+V6aqM5Luj56CB44CC5oiR5Lus5biM5pyb5o6o5bm/5ZCM5qC355qE6KeE
5YiZ5Yiw5Y2z5bCG6KKr5YaF5qC45ZCI5bm255qECj4gK1JJU0MtViDnm7jlhbPku6PnoIHjgIIK
PiArCj4gK1BhdGNod29yawo+ICstLS0tLS0tLS0KPiArCj4gK1JJU0MtViDmnInkuIDkuKogcGF0
Y2h3b3JrIOWunuS+i++8jOWPr+S7peWcqOmCo+mHjOafpeeci+ihpeS4geeahOeKtuaAge+8mgo+
ICsKPiArICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3Yv
bGlzdC8KPiArCj4gK+WmguaenOS9oOeahOihpeS4geS4jeWcqOm7mOiupOinhuWbvuS4reWHuueO
sO+8jOmCo+S5iCBSSVNDLVYg57u05oqk6ICF5b6I5pyJ5Y+v6IO95bey6KaB5rGC5L+u5pS577yM
5oiW6ICF5biM5pybCj4gK+WwhuWFtuW6lOeUqOWIsOWPpuS4gOS4quS7o+eggeagkeS4iuOAggo+
ICsKPiAr6Ieq5Yqo5YyW5rWB56iL5Lya5Zyo6K+lIHBhdGNod29yayDlrp7kvovkuIrov5DooYzv
vIzlnKjmr4/kuKrooaXkuIHliLDovr7ml7bnq4vliLvlr7nlhbbov5vooYzmnoTlu7ov5rWL6K+V
44CCCj4gK+iHquWKqOWMlua1geeoi+S8muagueaNruihpeS4geaYr+WQpuiiq+ivhuWIq+S4uuS/
ruWkje+8jOmAieeUqCBSSVNDLVYgYGZvci1uZXh0YCDmiJYgYGZpeGVzYCDliIbmlK8KPiAr5b2T
5YmN55qEIEhFQUTvvJvoi6XkuIrov7DlnYflupTnlKjlpLHotKXvvIzliJnkvb/nlKggUklTQy1W
IGBtYXN0ZXJgIOWIhuaUr+OAguihpeS4geezu+WIl+iiq+W6lOeUqOWIsOeahOWFtwo+ICvkvZPm
j5DkuqTlsIbmoIfms6jlnKggcGF0Y2h3b3JrIOS4iuOAguS7u+S9leajgOafpeacqumAmui/h+ea
hOihpeS4gemAmuW4uOS4jeS8muiiq+W6lOeUqO+8jOW5tuS4lOWcqOWkp+WkmuaVsOaDhQo+ICvl
hrXkuIvlsIbpnIDopoHph43mlrDmj5DkuqTjgIIKPiAgIAo+ICAg6ZmE5Yqg55qE5o+Q5Lqk5qOA
5p+l5Y2VCj4gICAtLS0tLS0tLS0tLS0tLS0tCj4gLeaIkeS7rOS7heaOpeWPl+ebuOWFs+agh+WH
huW3sue7j+iiq1JJU0MtVuWfuumHkeS8muagh+WHhuS4uuKAnOW3suaJueWHhuKAneaIluKAnOW3
suWGu+e7k+KAneeahOaJqeWxleaIluaooeWdl+eahOihpeS4geOAggo+IC3vvIjlvIDlj5HogIXl
vZPnhLblj6/ku6Xnu7TmiqToh6rlt7HnmoRMaW51eOWGheaguOagke+8jOWFtuS4reWMheWQq+aJ
gOmcgOS7o+eggeaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQo+IC0KPiAt5q2k5aSW77yMUklT
Qy1W6KeE6IyD5YWB6K6454ix5aW96ICF5Yib5bu66Ieq5bex55qE6Ieq5a6a5LmJ5omp5bGV44CC
6L+Z5Lqb6Ieq5a6a5LmJ5ouT5bGV5LiN6ZyA6KaB6YCa6L+HUklTQy1WCj4gLeWfuumHkeS8muea
hOS7u+S9leWuoeaguOaIluaJueWHhuOAguS4uuS6humBv+WFjeWwhueIseWlveiAheS4gOS6m+eJ
ueWIq+eahFJJU0MtVuaLk+Wxlea3u+WKoOi/m+WGheaguOS7o+eggeW4puadpQo+IC3nmoTnu7Tm
iqTlpI3mnYLmgKflkozlr7nmgKfog73nmoTmvZzlnKjlvbHlk43vvIzmiJHku6zlsIblj6rmjqXl
j5dSSVNDLVbln7rph5HkvJrmraPlvI/lhrvnu5PmiJbmibnlh4bnmoTnmoTmianlsZUKPiAt6KGl
5LiB44CC77yI5byA5Y+R6ICF5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qETGludXjlhoXmoLjm
oJHvvIzlhbbkuK3ljIXlkKvku5bku6zmg7PopoHnmoTku7vkvZXoh6rlrprkuYnmianlsZUKPiAt
55qE5Luj56CB44CC77yJCj4gK+aIkeS7rOS7heaOpeWPl+mSiOWvueaWsOaooeWdl+aIluaJqeWx
leeahOihpeS4ge+8jOWJjeaPkOaYr+i/meS6m+aooeWdl+aIluaJqeWxleeahOinhOiMg+iiq+WI
l+S4uuacquadpeS4jeWkquWPr+iDveWPkQo+ICvnlJ/kuI3lhbzlrrnnmoTlj5jmm7TjgILlr7nk
uo7mnaXoh6ogUklTQy1WIOWfuumHkeS8mueahOinhOiMg++8jOi/meaEj+WRs+edgOKAnOW3suWG
u+e7k+KAneaIluKAnOW3suaJueWHhuKAne+8jOWvueS6jgo+ICtVRUZJIOiuuuWdm+eahOinhOiM
g++8jOi/meaEj+WRs+edgOW3suWPkeW4g+eahCBFQ1LjgILvvIjlvIDlj5HogIXlvZPnhLblj6/k
u6Xnu7TmiqToh6rlt7HnmoQgTGludXgg5YaF5qC45qCR77yMCj4gK+WFtuS4reWMheWQq+S7luS7
rOaJgOmcgOeahOS7u+S9leaJqeWxleiNieahiOeahOS7o+eggeOAgu+8iQo+ICsKPiAr5q2k5aSW
77yMUklTQy1WIOinhOiMg+WFgeiuuOWunueOsOiAheWIm+W7uuiHquW3seeahOiHquWumuS5ieaJ
qeWxleOAgui/meS6m+iHquWumuS5ieaJqeWxleS4jemcgOimgemAmui/hyBSSVNDLVYKPiAr5Z+6
6YeR5Lya55qE5Lu75L2V5a6h5qC45oiW5om55YeG5rWB56iL44CC5Li65LqG6YG/5YWN5Zug5re7
5Yqg5a6e546w6ICF54m55a6a55qEIFJJU0MtViDmianlsZXluKbmnaXnmoTnu7TmiqTlpI3mnYIK
PiAr5oCn5ZKM5a+55oCn6IO955qE5r2c5Zyo5b2x5ZON77yM5oiR5Lus5bCG5Y+q6ICD6JmR56ym
5ZCI5Lul5LiL5Lu75LiA5p2h5Lu255qE5omp5bGV6KGl5LiB77yaCj4gKwo+ICstIOW3sueUsSBS
SVNDLVYg5Z+66YeR5Lya5q2j5byP5Ya757uT5oiW5om55YeGCj4gKy0g5bey5oyJ54Wn5qCH5YeG
IExpbnV4IOaDr+S+i++8jOWcqOW5v+azm+WPr+eUqOeahOehrOS7tuS4reWunueOsAo+ICsKPiAr
77yI5a6e546w6ICF5b2T54S25Y+v5Lul57u05oqk6Ieq5bex55qEIExpbnV4IOWGheaguOagke+8
jOWFtuS4reWMheWQq+S7luS7rOaJgOmcgOeahOS7u+S9leiHquWumuS5ieaJqeWxleeahOS7o+eg
geOAgu+8iQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
