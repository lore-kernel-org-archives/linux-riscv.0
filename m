Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A10BC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZTZgvcfqgwhogcHQjA0l8Hu4B+OCtfEUJC2IocNhjQ=; b=tCfX1qkn5gflY1
	JEHjSC/eFMva2yNakeZz8z4q1jPBpJ5F/VpqQNBYPteedD1kr4ggNEJbmXkbzfWIBZIWia4Y3QByF
	EQeO7WzsaRtwUKqbgK0lqECiI/CItLbVnF0t1g9ZpNBxid8zD60GDvWXMuv6g1wtpuyZ817CbLiNI
	bh8oMM8672yJAT3jzJ/512K0cFddw/Yd9Nksy28Apfhw1Dmm5UQ4YUwV3g4dhExnmjcoTZ0b7o1dc
	jUdkKuLPzTniwL4c8cgK1w4QIkJ+qEl96Dn1sHTDalNnpo6VqVI1/wEEnQGqLPnjw14VX/RBP5SBv
	O1lvOfIr9DSq6Knvebbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tezSp-0000000G1KV-26Mz;
	Mon, 03 Feb 2025 16:38:23 +0000
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tezNt-0000000G0UD-0Clu
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 16:33:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250203163312euoutp01cb4c1135f9fd6cd63d21209b8f3ed759~gv9hmftpS0956309563euoutp014
	for <linux-riscv@lists.infradead.org>; Mon,  3 Feb 2025 16:33:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250203163312euoutp01cb4c1135f9fd6cd63d21209b8f3ed759~gv9hmftpS0956309563euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738600392;
	bh=jgdfJb5XmANzNdoB6KpErLTImnQzyQ4B5YNgFymn8uo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ArvF0MjG65fVMg69mkVaEVQOM6koztY9TK3I68u4PfB9Btah+WikaNfHO5Oo/PTXM
	 7TMg1K8w3oBy5zF124yeE403UwXtSsHwJCt8Y8Ivfpxrn6PZGs3Eu0KQOVK1+GeMry
	 c5Wv4yZZu53nS6/sy2qyjNRjOBQnpmBS66hcz93k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250203163311eucas1p2e70de128fc35f5c0eed7024ef5d4a289~gv9g78N882024920249eucas1p2r;
	Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 26.35.20397.7CFE0A76; Mon,  3
	Feb 2025 16:33:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250203163311eucas1p17f75b2012c9341f93af43f586809a81e~gv9giSMB20911509115eucas1p1R;
	Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250203163311eusmtrp2f22113419fcf9cc31b947cee8f00f0da~gv9ggTqyx3261232612eusmtrp27;
	Mon,  3 Feb 2025 16:33:11 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-37-67a0efc7874e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id B5.E1.19654.7CFE0A76; Mon,  3
	Feb 2025 16:33:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250203163309eusmtip2fde20ae086616fd76f79d37061338a0b~gv9fQ-z-u2728927289eusmtip2B;
	Mon,  3 Feb 2025 16:33:09 +0000 (GMT)
Message-ID: <6bdd711e-6515-43b9-aec1-4d90b87ff09f@samsung.com>
Date: Mon, 3 Feb 2025 17:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Matt Coster <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
	"wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
	<Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"jszhang@kernel.org" <jszhang@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "m.szyprowski@samsung.com"
	<m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTHfW5v771U6y4FwxN1MJvNbE4QqjEPG0Nwc7tx02z7MMxMNhu9
	KUYorpVtkGUg5VWLuAG+XOxaGRNWpAItBToKWEkLoo3oBEd4S3SDMl6KwBYxo7Nc3Pj2O+f8
	zzn/8+ShBBI7sZ46qjzBqpTyJCkhwq3OJ+5w17RBEdlVHYo6+8ox1PCUI9FVuxtD+g63EA3d
	tWDo1/lpApl+v0OiMftJHPVW6UikcV4jkIcbItCMdkiI7tkuEWi2sAMg62w2gWo6Bkl0eaYB
	RxVNNoByC64IUc/NPWhwqBNHnntaAcrlXkC+liYSLfbW4ahsqo1ElonvhMhVk4Cy20rwuBeZ
	6Qc5JDPh8eDMjfw5krH/ZcCZZm6QZLTNtwBTbywgmIHeFoL5oesjZvi0C2PMFRlMdo0TY4r+
	iWSmW+8TzBmLETB3NX3kh5JPRTFH2KSjX7KqbbGHRInltyax41mhX+eVXMYyQQs8BQIoSO+A
	jTo9cQqIKAldBaCJMwv5YA5Am6kM8MEsgK1PTMLnLT1jJcuqSgDPjd7E+WASwLnrfhVFielY
	qJlQ+Rtw+mVoKnbgfhbTgbDr4qMlXkeHweH+C6Sfg+gEmHW7aMlHMN1IwTPm4aWCgM4UwPyz
	3/IcAvsf6TE/E7QMjlTqlxwFPNs1VTiK85owqGkoE/gHQbpHBO/UOpZtvwMLz3cDnoPguMtC
	8rwR+pr5oZBOgSMNjwU8fwObta5lfhMOuBcI/2EC+jV4zbaNT8fDPGc77k9Dei18MBnIW1gL
	v7eeF/BpMczPlfDqzbBUW/jfUneVFTsLpNyKV+FWHMmtOIb7f68B4EYQwqaqkxWseruS/SpC
	LU9WpyoVEYdTkuvBsx/eveiabwJV4zMRDoBRwAEgJZAGi7sbDQqJ+Ig8LZ1VpXyuSk1i1Q6w
	gcKlIeLythyFhFbIT7DHWPY4q3pexaiA9ZlY1sMuma7voMVX1/1Wd3Uc9zCx8/1g7+OMvezq
	pHWriyT7UmLlitpN1e3EH7oDGfPRV3YVJxyK36pKn25UyVoy6vsURHXOwKUklzvhWMTCuc7J
	Ovt9bd4Yycn2Xf0kcTJ6g3HsC+Fn3sDMk8SUd5Px9dOeqFW1UzEjrUGhO4NjNqZ/MF/5dqzn
	lSjQ5BjPt635ZY2SzPJGrdqq+rh9Z6j0+hvh7xksu/dWbC4bcSuDrGE/qQ9rircjzVOvg2Z+
	i/txzp1m3r+QpousuNGh18u2HAi/0D82suPVNNo5Gv1nqb7AFu/bb1809bzb5Dv4sxO+RICa
	XTnK3ViBec/tUv3Fv6W4OlEetUWgUsv/BUg5I2RQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7rH3y9IN2juYLE4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLu/dOsFi8vNzDbNE2
	i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
	AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPPr/Gni833eVzaNv
	yypGj0vN19kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
	Uov07RL0MhadectU0CRX0T5lIVMD4x6JLkZODgkBE4mLL6awdjFycQgJLGWUmD7tMgtEQkbi
	WvdLKFtY4s+1LjYQW0jgNaPEjo/KXYwcHLwCdhLNb4pAwiwCKhLrJh8CK+cVEJQ4OfMJmC0q
	IC9x/9YMdhBbWCBcoulsPxvILhGBvRwSu278ZAFxmAUamCVWzb7BDHHFcUaJpVNvgLUzC4hL
	3HoynwnEZhMwkniwfD4riM0JtPld73MWkCuYBdQl1s8TgiiXl2jeOpt5AqPQLCSHzEIyaRZC
	xywkHQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEpqxtx35u2cG48tVHvUOMTByMhxgl
	OJiVRHhPb1+QLsSbklhZlVqUH19UmpNafIjRFBgYE5mlRJPzgUkzryTe0MzA1NDEzNLA1NLM
	WEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkGpkmT2wK0y0tzT+9dVDvl59kVnyQuebUsahCP
	lfc9mZou9mz1PQd141UTT1SL/v7xVFR+2ZcLvRUFkecMlWacLF9Xw9VotezFllduDWH3jCtL
	J2ys4ZvOd8FXV/dHkkHlhFMT+oNeatrecDu4e2bv+ygGGblPrtx/fA39WB5Ob+u9dDO2t3iG
	cJSufZjTNnZNl1nsiTdOPT20qcQjec4Zzjli35SmzZVYdK97+9X0d42Lgu54LNCr8J2n9si+
	eX5L+MlwJwmdnc8Tv+vlPc56cYuzdQ9TY9La7SXnl/ds0T34rmBexe4NjrdqNTz8WqU5j12Z
	7iodsEohKVYiQ+oYuyZvaGjTyy1ty2Y/vv30vxJLcUaioRZzUXEiAECvIAbiAwAA
X-CMS-MailID: 20250203163311eucas1p17f75b2012c9341f93af43f586809a81e
X-Msg-Generator: CA
X-RootMTR: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
References: <CGME20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585@eucas1p1.samsung.com>
	<20250128194816.2185326-1-m.wilczynski@samsung.com>
	<ed7a463e-9654-41c3-91f6-f3f877fd9a20@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_083317_677623_8B4C045C 
X-CRM114-Status: GOOD (  23.93  )
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

CgpPbiAxLzMxLzI1IDE2OjM5LCBNYXR0IENvc3RlciB3cm90ZToKPiBPbiAyOC8wMS8yMDI1IDE5
OjQ3LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gVGhlIExpY2hlZVBpIDRBIGJvYXJkLCBm
ZWF0dXJpbmcgdGhlIFQtSEVBRCBUSDE1MjAgU29DLCBpbmNsdWRlcyBhbiBJbWFnaW5hdGlvbgo+
PiBUZWNobm9sb2dpZXMgQlhNLTQtNjQgR1BVLiBJbml0aWFsIHN1cHBvcnQgZm9yIHRoaXMgR1BV
IHdhcyBwcm92aWRlZCB0aHJvdWdoIGEKPj4gZG93bnN0cmVhbSBkcml2ZXIgWzFdLiBSZWNlbnRs
eSwgZWZmb3J0cyBoYXZlIGJlZW4gbWFkZSB0byB1cHN0cmVhbSBzdXBwb3J0IGZvcgo+PiB0aGUg
Um9ndWUgZmFtaWx5IEdQVXMsIHdoaWNoIHRoZSBCWE0tNC02NCBpcyBwYXJ0IG9mIFsyXS4KPj4K
Pj4gV2hpbGUgdGhlIGluaXRpYWwgdXBzdHJlYW0gZHJpdmVyIGZvY3VzZWQgb24gdGhlIEFYRS0x
LTE2IEdQVSwgbmV3ZXIgcGF0Y2hlcwo+PiBoYXZlIGludHJvZHVjZWQgc3VwcG9ydCBmb3IgdGhl
IEJYUy00LTY0IEdQVSBbM10uIFRoZSBtb2Rlcm4gdXBzdHJlYW0KPj4gZHJtL2ltYWdpbmF0aW9u
IGRyaXZlciBpcyBleHBlY3RlZCB0byBzdXBwb3J0IHRoZSBCWE0tNC02NCBhcyB3ZWxsIFs0XVs1
XS4gQXMKPj4gdGhpcyBzdXBwb3J0IGlzIGJlaW5nIGRldmVsb3BlZCwgaXQncyBjcnVjaWFsIHRv
IHVwc3RyZWFtIHRoZSBuZWNlc3NhcnkgZ2x1ZQo+PiBjb2RlIGluY2x1ZGluZyBjbG9jayBhbmQg
cG93ZXItZG9tYWluIGRyaXZlcnMgc28gdGhleSdyZSByZWFkeSBmb3IgaW50ZWdyYXRpb24KPj4g
d2l0aCB0aGUgZHJtL2ltYWdpbmF0aW9uIGRyaXZlci4KPj4KPj4gUmVjZW50IFByb2dyZXNzOgo+
Pgo+PiBGaXJtd2FyZSBJbXByb3ZlbWVudHM6Cj4+IFNpbmNlIEF1Z3VzdCwgdGhlIHZlbmRvciBo
YXMgcHJvdmlkZWQgdXBkYXRlZCBmaXJtd2FyZQo+PiBbNl1bN10gdGhhdCBjb3JyZWN0bHkgaW5p
dGlhdGVzIHRoZSBmaXJtd2FyZSBmb3IgdGhlIEJYTS00LTY0Lgo+Pgo+PiBNZXNhIERyaXZlciBU
ZXN0aW5nOgo+PiBUaGUgdmVuZG9yLXN1cHBsaWVkIE1lc2EgZHJpdmVyIFs4XSBwYXJ0aWFsbHkg
d29ya3Mgd2l0aCBWdWxrYW4gZXhhbXBsZXMsIHN1Y2gKPj4gYXMgcmVuZGVyaW5nIGEgdHJpYW5n
bGUgdXNpbmcgU2FzY2hhIFdpbGxlbXMnIFZ1bGthbiBzYW1wbGVzIFs5XS4gQWx0aG91Z2ggdGhl
Cj4+IHRyaWFuZ2xlIGlzbid0IHJlbmRlcmVkIGNvcnJlY3RseSAob25seSB0aGUgYmx1ZSBiYWNr
Z3JvdW5kIGFwcGVhcnMpLCBzaGFkZXIKPj4gam9iIHN1Ym1pc3Npb25zIGZ1bmN0aW9uIHByb3Bl
cmx5LCBhbmQgSU9DVEwgY2FsbHMgYXJlIGNvcnJlY3RseSBpbnZva2VkLiAgRm9yCj4+IHRlc3Rp
bmcsIHdlIHVzZWQgdGhlIGZvbGxvd2luZyByZXNvdXJjZXM6Cj4+Cj4+IEtlcm5lbCBTb3VyY2U6
IEN1c3RvbSBrZXJuZWwgd2l0aCBuZWNlc3NhcnkgbW9kaWZpY2F0aW9ucyBbMTBdLgo+PiBNZXNh
IERyaXZlcjogVmVuZG9yLXByb3ZpZGVkIE1lc2EgaW1wbGVtZW50YXRpb24gWzExXS4KPj4KPj4g
RGVwZW5kZW5jaWVzOgo+PiBUZXN0aW5nIHJlcXVpcmVkIGEgZnVuY3Rpb25hbCBEaXNwbGF5IFBy
b2Nlc3NpbmcgVW5pdCAoRFBVKSBhbmQgSERNSSBkcml2ZXIsCj4+IHdoaWNoIGFyZSBjdXJyZW50
bHkgbm90IHVwc3RyZWFtZWQuIEVmZm9ydHMgYXJlIHVuZGVyd2F5IHRvIHVwc3RyZWFtIHRoZSBE
UFUKPj4gREM4MjAwIGRyaXZlciB1c2VkIGluIFN0YXJGaXZlIGJvYXJkcyBbMTJdLCB3aGljaCBp
cyB0aGUgc2FtZSBEUFUgdXNlZCBvbiB0aGUKPj4gTGljaGVlUGkgNEEuIE9uY2UgdGhlIERQVSBh
bmQgSERNSSBkcml2ZXJzIGFyZSB1cHN0cmVhbWVkLCBHUFUgc3VwcG9ydCBjYW4gYmUKPj4gZnVs
bHkgdXBzdHJlYW0uCj4+Cj4+IFRlc3RpbmcgU3RhdHVzOgo+PiBUaGlzIHNlcmllcyBoYXMgYmVl
biB0ZXN0ZWQgYnkgcGVyZm9ybWluZyBhIHByb2JlLW9ubHkgb3BlcmF0aW9uLCBjb25maXJtaW5n
Cj4+IHRoYXQgdGhlIGZpcm13YXJlIGJlZ2lucyBleGVjdXRpb24uIFRoZSBwcm9iZSBmdW5jdGlv
biBpbml0aWF0ZXMgZmlybXdhcmUKPj4gZXhlY3V0aW9uIGFuZCB3YWl0cyBmb3IgdGhlIGZpcm13
YXJlIHRvIGZsaXAgYSBzcGVjaWZpYyBzdGF0dXMgYml0Lgo+Pgo+PiBbICAgMTIuNjM3ODgwXSBw
b3dlcnZyIGZmZWY0MDAwMDAuZ3B1OiBbZHJtXSBsb2FkZWQgZmlybXdhcmUgcG93ZXJ2ci9yb2d1
ZV8zNi41Mi4xMDQuMTgyX3YxLmZ3Cj4+IFsgICAxMi42NDg5NzldIHBvd2VydnIgZmZlZjQwMDAw
MC5ncHU6IFtkcm1dIEZXIHZlcnNpb24gdjEuMCAoYnVpbGQgNjY0NTQzNCBPUykKPj4gWyAgIDEy
LjY3ODkwNl0gW2RybV0gSW5pdGlhbGl6ZWQgcG93ZXJ2ciAxLjAuMCBmb3IgZmZlZjQwMDAwMC5n
cHUgb24gbWlub3IgMAo+Pgo+PiBQb3dlciBNYW5hZ2VtZW50Ogo+PiBGdWxsIHBvd2VyIG1hbmFn
ZW1lbnQgY2FwYWJpbGl0aWVzIHJlcXVpcmUgaW1wbGVtZW50aW5nIHRoZSBULUhFQUQgU29DIEFP
Tgo+PiBwcm90b2NvbCBtZXNzYWdpbmcgdmlhIHRoZSBoYXJkd2FyZSBtYWlsYm94LiBTdXBwb3J0
IGZvciB0aGUgbWFpbGJveCB3YXMgbWVyZ2VkCj4+IGluIGtlcm5lbCA2LjEzIFsxM10sIGFuZCB0
aGUgQU9OIHByb3RvY29sIGltcGxlbWVudGF0aW9uIGlzIHBhcnQgb2YgdGhpcwo+PiBzZXJpZXMs
IHNpbmNlIHYyLiBUaGVyZWZvcmUgdGhpcyBzZXJpZXMgc3VwcG9ydCBmdWxsIHBvd2VyIG1hbmFn
ZW1lbnQKPj4gY2FwYWJpbGl0aWVzIGZvciB0aGUgR1BVIGRyaXZlci4KPj4KPj4gVGhhbmtzIGV2
ZXJ5b25lIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IHRoZSBsYXN0IHJldmlzaW9uICEg
WW91cgo+PiBndWlkYW5jZSBhbmQgdGhlIGRpcmVjdGlvbiB3YXMgdmVyeSBoZWxwZnVsLgo+IAo+
IEhpIE1pY2hhbCwKPiAKPiBUaGlzIGlzIGF3ZXNvbWUsIHRoYW5rcyBmb3IgY29udHJpYnV0aW5n
ISBJIGFwb2xvZ2lzZSBmb3Igbm90IHJlc3BvbmRpbmcKPiB0byBlYXJsaWVyIHZlcnNpb25zICh0
aGluZ3MgaGF2ZSBiZWVuIHByZXR0eSBidXN5IGhlcmUpLCBidXQgdGhleSBoYXZlCj4gdmVyeSBt
dWNoIGJlZW4gb24gbXkgcmFkYXIuCj4gCj4gSSBzZWUgeW91J3JlIGFscmVhZHkgYXdhcmUgb2Yg
bXkgb3RoZXIgQi1TZXJpZXMgcGF0Y2hzWzNdOyB3b3VsZCB5b3UKPiBtaW5kIHJlYmFzaW5nIHRo
ZXNlIGNoYW5nZXMgb24gdG9wIG9mIHRob3NlPyBXZSdyZSBtYWtpbmcgc29tZSBub3QKPiBpbnNp
Z25pZmljYW50IGNoYW5nZXMgdG8gdGhlIGJpbmRpbmdzIHdoaWNoIHdpbGwgY29uZmxpY3Qgd2l0
aCBhbnkgbmV3Cj4gR1BVcyBhZGRlZCBpbiB0aGUgbWVhbnRpbWUuIEknbGwgbGVhdmUgY29tbWVu
dHMgaW4gdGhpcyBzZXJpZXMgd2hlcmUgSQo+IHN1c3BlY3QgdGhlIGNvbmZsaWN0cyB3aWxsIGFw
cGVhci4KPiAKPiBDaGVlcnMsCj4gTWF0dAoKCkhpIE1hdHQsCgpUaGFua3MgZm9yIHlvdXIgcmV2
aWV3LCBhbmQgbm8gd29ycmllcyBhYm91dCB0aGUgZGVsYXkgaXTigJlzIHRvdGFsbHkKdW5kZXJz
dGFuZGFibGUuIEkgYXBwcmVjaWF0ZSB0aGUgaGVhZHMtdXAgYWJvdXQgdGhlIGR0LWJpbmRpbmdz
IHdvcmsgaW4KcHJvZ3Jlc3MuIEkganVzdCB3YW50ZWQgdG8gc2hhcmUgYSB3b3JraW5nIHNvbHV0
aW9uIGZvciBub3csIGJ1dCBJ4oCZbGwKZGVmaW5pdGVseSByZWJhc2UgdGhlc2UgcGF0Y2hlcyBv
bmNlIHlvdXIgY2hhbmdlcyBhcmUgaW4gcGxhY2UuCgpDaGVlcnMsIE1pY2hhbAoKPiAKCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
