Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE9D730B1
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnJMRs9+t9Ow4WbDKgM5ONYemW4JgzM35xJk+0fi86w=; b=u5CtYFxzlmqJ2y
	1tYL9+q/ftnyL3rSoBc7NfggiXVahnxw9YjpO5ySIcFu7vq6q0NpQR1+vABe7W6lyNE0kgWwIceUz
	Z1gPgVRN8kCwGNb94ljcT7iWHNDPX2vyyc8s6eOVS1BX2K2BOb0TIcPtaR4fJjJq9PvS5+o7XR/+4
	+9hKUIC041/xUzIt30dq/H8LHbrA2fd6Ov7JLcskkI6aO9mGW9mKGFko12G3x4PnWURWnmw2tS1T8
	wSq1HCTLXT9e2HJt0oMNP3xaDwHhsSc+L7uD7XlUsZl0lAK5eTHJ0pF5iBSmUYjmWiR+/VkxUbw0N
	DggUwi/mu5f2/T2vQUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Z89-00000001eKp-3gQm;
	Fri, 03 Apr 2026 07:39:49 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Z86-00000001eJx-2t7K
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 07:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775201942;
	bh=3h6PCBhK+GmUAvpew4gV0+Q3qE8MjchgRGdsRDC+Z9Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=jwuZplbpP0fl495xlE9Yhu2HegjApYJ86oEXV/dn7LcsKugwlfLuKLWyfUYAgePtN
	 WHpBm25SEUSyArXGFSTv8/TIar689bb4zPDycad4d8OLpM5gXd5kHW1OaFt4/1iGXX
	 W8AiFJUXt5Etj3HscnPCKS8CQ8BwMHp94WRyiaS8=
X-QQ-mid: esmtpgz10t1775201941td89a0a59
X-QQ-Originating-IP: cj0l0PHmoJAqQPXzcnj1rZV0m6yylIlsDPyvdVE0ZGM=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Apr 2026 15:37:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7692448417985247740
Message-ID: <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
Date: Fri, 3 Apr 2026 15:37:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: liangzhen <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
To: himanshu.chauhan@oss.qualcomm.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 shuah@kernel.org
References: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M5r28j6evhA1OJY3BdoXABA5FfQOKHCnDu0xVlHkkBvTt7MM8nIjN8+Q
	slPKkW8/23rZ0epVEVuki5PIdel98VSVPddoEgsXDHS+XPPFn7tCHAnYIhrBQFwrq8KL8ap
	L+xn95oExWqdaP8JklHTZQFlBejMICpmLmTTzGprd5GDna3v2SCqbRfXN9KabjuOthpiHvz
	IK+qbFcmy1v8gx/72i5ANyqO3trbFo0+qZ1Is9pthFGYdQvWdfgPU0hn752s3ZFICu/Bkrl
	wW/qOHubfGaO9/SaBh8KH8oW9stOseCBofDe+iNYToxYI7bkRTs6uEO6zGxun3UMuRD/zHX
	07OiGWnhyi7yWZ/3ywvCXQnUWZS3mOwm2lKCafnYlaBNnb+T8T7V8mAhpgevUlZEC2dE4EB
	Q2uCrOJIMmDQvEyV5T6kLlMIqqjmcOsYCBGLbjaVhqKq6c9NqF1fFdGidrmjIlmmcewboft
	SFumxm+UvgTINj8rsQn9j1qzXzKYwg/O8R9OjYJGTcot1Rlypj8g5rq+O0vaW5mldhEmNAN
	v4dAmpZ1DQT4yYvtYKYsDqel707sPqyL7dW6D/y3ZQkLXpSDgN56HoYyEyMqvitvoXg946/
	aunPUOG8uK6a8pwXYa24/5sqZ81mA3PNSjyhd4B3vhOLSMs9Ub/JWWJURyP19y1om/F7TzJ
	91gsdaDwnmc2HuCyTCEB07KSteAmUW55Sgwr+MiQNIep7O+sPrnUcK2B6Kyt76iatSWF7J6
	4RUbnYs8G5wCemcIcdOAME39Qo4gRuIxjMFwyazDw3gP8hpuEpMOt48Hjvc0WJKk0bK348I
	O7+gY+xg7Z63hpxgwbMlyEOU+IMP/q4834jy8ElxVlwpMa9StyDWD5fVwO+MmoyR/yunja+
	Kksb+R+lQll18r/yTluI8tnP+/D9XmGndKunRbCO4ddVjLnvYySNUCQR/76tdH12hbQIk/2
	RTMd15FWuNkXjr1iF0NIlm/SGxW4zpCEaVkoLNLj6UTtZT8f5O2dBVwBHtssmkoYEPAC28j
	DqbIS931QDcf9BszgaRYPrSJNCta1/QuYAFexWZhlfW+sIsaRr
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_003947_601308_D0301F6B 
X-CRM114-Status: UNSURE (   5.93  )
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

SGkswqAKClRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCwgSSBoYXZlIG9uZSBxdWVzdGlvbiByZWdh
cmRpbmcgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHNpemUgZmllbGQ6CgpPbiBNb24sIEZlYiAy
MywgMjAyNiBhdCAxMDoxOToxN0FNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgoKPivC
oCDCoCBjYXNlIEhXX0JSRUFLUE9JTlRfTEVOXzE6Cj4rwqAgwqAgwqAgwqAgaHctPmxlbiA9IDE7
Cj4rwqAgwqAgwqAgwqAgaHctPnRkYXRhMSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0
YTEsIDEpOwo+K8KgIMKgIMKgIMKgIGJyZWFrOwo+K8KgIMKgIGNhc2UgSFdfQlJFQUtQT0lOVF9M
RU5fMjoKPivCoCDCoCDCoCDCoCBody0+bGVuID0gMjsKPivCoCDCoCDCoCDCoCBody0+dGRhdGEx
ID0gUlZfREJUUl9TRVRfTUM2X1NJWkUoaHctPnRkYXRhMSwgMik7Cj4rwqAgwqAgwqAgwqAgYnJl
YWs7Cj4rwqAgwqAgY2FzZSBIV19CUkVBS1BPSU5UX0xFTl80Ogo+K8KgIMKgIMKgIMKgIGh3LT5s
ZW4gPSA0Owo+K8KgIMKgIMKgIMKgIGh3LT50ZGF0YTEgPSBSVl9EQlRSX1NFVF9NQzZfU0laRSho
dy0+dGRhdGExLCAzKTsKPivCoCDCoCDCoCDCoCBicmVhazsKPivCoCDCoCBjYXNlIEhXX0JSRUFL
UE9JTlRfTEVOXzg6Cj4rwqAgwqAgwqAgwqAgaHctPmxlbiA9IDg7Cj4rwqAgwqAgwqAgwqAgaHct
PnRkYXRhMSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0YTEsIDUpOwo+K8KgIMKgIMKg
IMKgIGJyZWFrOwoKR0RCJ3MgZ2RiYXJjaF9icmVha3BvaW50X2Zyb21fcGMgbWV0aG9kIHJldHVy
bnMgbGVuPTIgZm9yIG5vbi1hbGlnbmVkIGFkZHJlc3NlcywgY2F1c2luZyBzaXplIG1pc21hdGNo
IHdpdGggaGFyZHdhcmUgdHJpZ2dlcnMuwqAKCkEgc2ltcGxlIHRlc3QgaXMgYXMgZm9sbG93czoK
CnJvb3RAazM6fiMgY2F0IHRlc3QuYwojaW5jbHVkZSA8c3RkaW8uaD4KCmludCBhID0gMDsKaW50
IG1haW4oKQp7CsKgIMKgIMKgIMKgIHByaW50Zigic3RhcnQgdGVzdFxuIik7CsKgIMKgIMKgIMKg
IGEgPSAxOwrCoCDCoCDCoCDCoCBwcmludGYoImEgPSAlZFxuIiwgYSk7CsKgIMKgIMKgIMKgIHBy
aW50ZigiZW5kIHRlc3RcbiIpOwrCoCDCoCDCoCDCoCByZXR1cm4gMDsKfQoKCnJvb3RAazM6fiMg
Z2NjIC1tYXJjaD1ydjY0Z2MgLWcgdGVzdC5jIC1vIHRlc3QKcm9vdEBrMzp+IyBnZGIgdGVzdAou
Li4Kc3RhcnQKLi4uClRlbXBvcmFyeSBicmVha3BvaW50IDEsIG1haW4gKCkgYXQgdGVzdC5jOjYK
NsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJpbnRmKCJzdGFydCB0ZXN0XG4iKTsKKGdkYikgeC84
aSAkcGMKPT4gMHgyYWFhYWFhNmVhIDxtYWluKzg+OsKgIMKgIMKgIMKgYXVpcGPCoCDCoGEwLDB4
MArCoCDCoDB4MmFhYWFhYTZlZSA8bWFpbisxMj46wqAgwqAgwqAgYWRkacKgIMKgIGEwLGEwLDg2
CsKgIMKgMHgyYWFhYWFhNmYyIDxtYWluKzE2PjrCoCDCoCDCoCBqYWzCoCDCoCDCoDB4MmFhYWFh
YTVkMCA8cHV0c0BwbHQ+CsKgIMKgMHgyYWFhYWFhNmY2IDxtYWluKzIwPjrCoCDCoCDCoCBhdWlw
Y8KgIMKgYTUsMHgyCsKgIMKgMHgyYWFhYWFhNmZhIDxtYWluKzI0PjrCoCDCoCDCoCBhZGRpwqAg
wqAgYTUsYTUsLTE3NzAKwqAgwqAweDJhYWFhYWE2ZmUgPG1haW4rMjg+OsKgIMKgIMKgIGxpwqAg
wqAgwqAgYTQsMQrCoCDCoDB4MmFhYWFhYTcwMCA8bWFpbiszMD46wqAgwqAgwqAgc3fCoCDCoCDC
oCBhNCwwKGE1KQrCoCDCoDB4MmFhYWFhYTcwMiA8bWFpbiszMj46wqAgwqAgwqAgYXVpcGPCoCDC
oGE1LDB4MgooZ2RiKSBoYnJlYWsgKjB4MmFhYWFhYTZmMgpIYXJkd2FyZSBhc3Npc3RlZCBicmVh
a3BvaW50IDIgYXQgMHgyYWFhYWFhNmYyOiBmaWxlIHRlc3QuYywgbGluZSA2LgooZ2RiKSBjCkNv
bnRpbnVpbmcuCnN0YXJ0IHRlc3QKYSA9IDEKZW5kIHRlc3QKW0luZmVyaW9yIDEgKHByb2Nlc3Mg
MTc4NCkgZXhpdGVkIG5vcm1hbGx5XQooZ2RiKQoKcm9vdEBrMzp+IyBnY2MgLW1hcmNoPXJ2NjRn
IC1nIHRlc3QuYyAtbyB0ZXN0CnJvb3RAazM6fiMgZ2RiIHRlc3QKLi4uCnN0YXJ0Ci4uLgpUZW1w
b3JhcnkgYnJlYWtwb2ludCAxLCBtYWluICgpIGF0IHRlc3QuYzo2CjbCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHByaW50Zigic3RhcnQgdGVzdFxuIik7CihnZGIpIHgvOGkgJHBjCj0+IDB4MmFhYWFh
YTZmNCA8bWFpbisxNj46wqAgwqAgwqAgYXVpcGPCoCDCoGEwLDB4MArCoCDCoDB4MmFhYWFhYTZm
OCA8bWFpbisyMD46wqAgwqAgwqAgYWRkacKgIMKgIGEwLGEwLDEwMArCoCDCoDB4MmFhYWFhYTZm
YyA8bWFpbisyND46wqAgwqAgwqAgamFswqAgwqAgwqAweDJhYWFhYWE1ZDAgPHB1dHNAcGx0PgrC
oCDCoDB4MmFhYWFhYTcwMCA8bWFpbisyOD46wqAgwqAgwqAgYXVpcGPCoCDCoGE1LDB4MgrCoCDC
oDB4MmFhYWFhYTcwNCA8bWFpbiszMj46wqAgwqAgwqAgYWRkacKgIMKgIGE1LGE1LC0xNzgwCsKg
IMKgMHgyYWFhYWFhNzA4IDxtYWluKzM2PjrCoCDCoCDCoCBsacKgIMKgIMKgIGE0LDEKwqAgwqAw
eDJhYWFhYWE3MGMgPG1haW4rNDA+OsKgIMKgIMKgIHN3wqAgwqAgwqAgYTQsMChhNSkKwqAgwqAw
eDJhYWFhYWE3MTAgPG1haW4rNDQ+OsKgIMKgIMKgIGF1aXBjwqAgwqBhNSwweDIKKGdkYikgaGJy
ZWFrICoweDJhYWFhYWE2ZmMKSGFyZHdhcmUgYXNzaXN0ZWQgYnJlYWtwb2ludCAyIGF0IDB4MmFh
YWFhYTZmYzogZmlsZSB0ZXN0LmMsIGxpbmUgNi4KKGdkYikgYwpDb250aW51aW5nLgoKQnJlYWtw
b2ludCAyLCAweDAwMDAwMDJhYWFhYWE2ZmMgaW4gbWFpbiAoKSBhdCB0ZXN0LmM6Ngo2wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwcmludGYoInN0YXJ0IHRlc3RcbiIpOwooZ2RiKQoKQXMgYSByZXN1
bHQsIGhhcmR3YXJlIGJyZWFrcG9pbnRzIHNldCBvbiAxNi1iaXQgaW5zdHJ1Y3Rpb24gYWRkcmVz
c2VzIG1heSBmYWlsIHRvIHRyaWdnZXIgZHVlIHRvIHRoaXMgc2l6ZSBtaXNtYXRjaC4gU28gY2Fu
IHdlIGNvbnNpZGVyIHNldHRpbmcgdGhlIFNJWkUgZmllbGQgdG8gMCAobWF0Y2ggYW55IHNpemUp
LCBoYXJkd2FyZSB0cmlnZ2VycyBtYXRjaCBtZW1vcnkgYWNjZXNzZXMgb2YgYW55IHNpemUuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
