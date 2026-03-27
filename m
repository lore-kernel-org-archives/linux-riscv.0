Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F8B10ED674
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoYmRMoXqVPS8oYNLC7l9Hs7Vko7kStjXU2jqm9Z6W8=; b=bHIVWd9Z9hsWC6
	gMqQwI7VuLEBIuQabNkcOnepELyA2AzFEREZ39ewQFg52Aki/bhi037kT598B5qLzTrhNc6wnOC53
	hNXoA2rH/OB52x3nvmInw/fFwTLDPwrr78orCyrAb1E48mqk+eUbBw/+v6jy31bIn0OtbW4mYOl3d
	OCsGsB+QuYH8GmjmZlt/EFa1Xhv6BGB8G6RtK5fly9is+lbgk+hXjPNWKxQrR933k0cnMgSjJndw7
	cmacpME+4jYJVs3k5kpUWG1eExdsUxder6XAC0Qa6ZHi0/eb4zpW4iIWzXNpjNi/m/6xlircPr/eI
	cAsB7D1B0GQ5kIJbSUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684k-00000007bKL-2n0V;
	Fri, 27 Mar 2026 14:22:14 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684h-00000007bIo-3IQa
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 14:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.at;
	s=s31663417; t=1774621310; x=1775226110; i=manfred.schlaegl@gmx.at;
	bh=RyXgL4ft4UGutAjMlvfPmmlceNb9GuHF4mFfM1uhinY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KHHPnU/NxhNLlW0KmQC1WDaj80HdwA4GqmbD/IiAmzUx+ahuC9OxN0s2UNm4N9lU
	 ZI7vU6fN6/V+jOFT53y9UTGI6RvGBXtaoE1qrYpxWJIliHrUir3utTHgDJm9l63KA
	 CEWvSKWGz105hFeTPsvsUhSxiMZmn+BGv2yQAr7Nw+Sc7/5BMewSdQ3Soixth00nd
	 C+fcIEyubcoFHiMpIKX0prRjqvWyLtExzuqXyPekElzlTTWcEZN803liCMB60+YAp
	 ZR3+uIz4pgmc+GCCvN+9cjBxik8O5DawVu51vrMpq0Kk9n7bnY8zAlWLyenlhXCy5
	 ZYs03kU0iwz8K7tpNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M4JmN-1w6PBX0pwf-0071lg; Fri, 27
 Mar 2026 15:21:50 +0100
Message-ID: <502b6589-6430-458d-af58-6404b06816a9@gmx.at>
Date: Fri, 27 Mar 2026 15:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: restore U-mode counter access (scounteren)
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260326111713.2282289-1-manfred.schlaegl@gmx.at>
 <fyf2z2tdzm7cu52kybmwvigvxpwigdceasveenjnoes6g6ilwi@otq2sp3m3qam>
From: Manfred Schlaegl <manfred.schlaegl@gmx.at>
Content-Language: en-US
Autocrypt: addr=manfred.schlaegl@gmx.at; keydata=
 xsFNBFHjNF8BEADHybsBKXEUFf/f2HstQlUk+Hs7PeVExsK7ddSrRZwxGzFqxB0/sugXtT3R
 kbwkWZWNu6AjD3xMoxrguFUAgIHu/U7xXqmh+fIMIh8I0UMlNjMcwHSLuWoA6r/GS8Nz0F2d
 DK93Mm8hQx44qzFjg9X+la6ECnrTpUBbL9sbeQ2HTsbDdWr0S+FXTYiIcZOZtGhe6jLfFTw9
 RTfTDxLkOmQQLXlVbIIXJXXIHvgY8dxki8jAV8GYGc4gfXHX0i1IdCMXvMrTlggvJ9nuS/Em
 0QLQ0nICYarQ2RUwXX9e5iPSYBgSsZVWhrZL8eJ3LnTyFoMQvBcf7JtHOwCgddHFoPE4dzJF
 5gucNN7ZsT5ST6QQ4NvXKxv3eMOSqAf7+kTwAfsrylG/Bkw1dyrR2bTKQD2LqLhWUVbOJTEe
 gudpq2CoeLww/l64XNP2xjZ4vwOnLyEIdrSQtqhS1qJa0W0gwEMNJsiPjO5BAoaCUnrZD8Ni
 Z1U8oo62Lre2xuppBeQ7aohi+0WrBLz3o6qmSjk38+SCRtK3vKFcUZ+GexmBWEhcly5o0KBQ
 fV9fk+4EEzGHeFZtPSPQNOYdIhMtCnaN9SdvcdgPXrXMWIDHNhWaOdDu41vjeFU4m5dFeAdw
 xKsm6jfxqg3uo/aLxcHN/7XzNVNmqPxLC1MVH0k2GEXyofG+5QARAQABzSpNYW5mcmVkIFNj
 aGxhZWdsIDxtYW5mcmVkLnNjaGxhZWdsQGdteC5hdD7CwXgEEwECACIFAlIThOMCGwMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGS1eKPM78WhooIQALXsTa9dQiV8RLz/aCBz5mdJ
 eJRkG4hzOVloMl+Dr33Y+/sV8+r7fUiIKJlGl80PWDnokOxlXIADjAv+7eYkCaeHT9D53kmB
 B481mr0oWWF13hHs1o5vMKy9FiovbadjdqKtslJmwn22COEr6s83LkGbnEO+nqvoNYOWSfMB
 S7uvzYvxFRwLZREWa47rKrqhqlm+j6/j20odkOHApvf7SwLtdDXy0iRFonD2P4lBFuI7y0Cq
 R+ub/EElsgOUj2BVZ0WBdScmZ0t13t6hzSiuTkpgIvX15GKk3Nz/6tqW62QAA5CvGGj+0kZa
 aBKvUTBx0JXG3W2jzVyKIvMDbuSqjuWmlm8S+q/t0/dQDxPz3gGaXYQPzOKD9psTRUpjwIbk
 1lXDDPolAtdkRYcOCcubLKJHYzz6zAeoGOz7OBal2kKrZgYNLmnO/AIT9h8qFcDpCgZ6wcPz
 iwk0HV17SaXtO0GTQM9eJUDPnZgTGefmbzmdoaLZdqN0AoFGw54kAcWxriURZf2tjPxs3pgg
 iV1LzgeMomc/veokAyXB6pBQDPnG7jNdnOFXadLx/YmtN+w5eh9D85LqX673fX/Rg5Fw0X26
 C96p005RDV3WsUuIx2IrhprzUq8A5QxzuL90DzxECY+dySbiQj5eVnejytJzPzGaQYahKZB2
 +rGt6nYlyHbKzsFNBFHjNF8BEAC6aEj0nzj+S4erka8r14DHfhRqu4VtqDtCbLtkPkW2cPvt
 6RtfR5vGcogcbbhiNpXipxA2krxA6GX28TRDj/W8yjh3JN53xFOrR4W1n18DhO1mIcv3VA0b
 5tnmcxQOAEvDf1TOoV9berTd2uzPoAZ+82uIpxsoQqWfc+83tKpUNKJE5JNxms+S0RgGw1Sh
 MFeFm0qJPN/yGgbMk2vJciYktV6HI/hueC042d5/2Zb/dDSf+XRWCSichStULPFbncDDbBCB
 9oIgpE6dFFQ27Dg2zCoaq1FRLk8qP3RfxlpXN2cyy+oisOtRGCuhNdgZOANoee/RliKW8pSx
 IzBp9d1sX7C69c8Vr9+D5OPfNP3cJvPmKnUuiiwu5hHmLqiUsYGW8OTPO+yqsDJQSr+WpsVt
 /dxdzmZAJSknOqT7JWZNlTGoRT9AvVLdwX9Rzi3QRFVrDrwqPgGf82nbcU00smATWy+/HyB2
 /hbpTGfDzmbgBLDIxog7KyivImFXmk2xiwvCk42AvdxDi4veAw0+9rdl08cJGfhja/1Q/n3g
 xtWMoz1piYRQs66HYLwK+K95OpataJktCeco1bUmFHbAe7HETHvPZRusU4uhIGMJVSq2hGBU
 GMK+mw5ci+/+d1KPt3dVSqV+CGXm2jvbyj/srho5pDY0W4xNVg8XlVwdAqZ9EQARAQABwsFf
 BBgBAgAJBQJR4zRfAhsMAAoJEGS1eKPM78WhgHsP/R2snWtI7DZgc475i31EwWXTyq5+ALwM
 36d3p5Pg17G0Oqttgcm61JddPV3E6n7hRQMi4jVtC412G7KPAhR4MJq8FWeZyVAfdx5eN5sy
 mYeUAlnranXe3FBpJ+F+BqXf8Ul+P+go13dopoupuio390VSoqOx4jnnypwncUTmFtyP63TR
 ro19Bg+Qme9NzIzccJ2QnF9+oF6DKxZHTc052ulzrztYhgNunLzC0Ip4q6OGpre9RGkbz7v3
 clxl/VxE6HFfiVa5qefG6zmbON8B64ZtEGgCyGZY68nxnhV6oTL0EbSMyAqvLYber8YDfhLK
 M6AK+C9k4UyNTYIxrH4ghGzBqZEVFzwgzSCMwfiHo/017eEz0ka8WiItgHatl2XoJabd06h2
 dMHfV7BhT2c2g47CXA7L/EgyjqqR8Nf7+8nN/dgS9RRdii802XEbizFQX1ABHoOnrdiZ04Q9
 r2jYBpSpOEOnSusgP05nwDndzx2oZnHHkYzsoZmKm+bUcl+5oDPrJgTpwMMkXZvpKP9WzsPP
 9hZ0P1FdBbI3/bVYi0aLp2noVPxdNh6R9JIf8kVkcfeNptI/NVZ/PpA1MypzSI4asEiKJvQ2
 cBTmqQqis0fRSEdK1audHwlXPVD9fsOAoWxRq5HActc8hoEcQvv3XMbJ/hMddSiyvaOovJlC aNNf
In-Reply-To: <fyf2z2tdzm7cu52kybmwvigvxpwigdceasveenjnoes6g6ilwi@otq2sp3m3qam>
X-Provags-ID: V03:K1:ZL90qo+uyH2N3YiB4vQEiIvShhjHTzMK+4YY+SjMxTPp7y8Q2vL
 aH/UJB1Tfnm+KS+w4T4lBzI4g48lpVe4GuE8BjeRjkc21L3P/Hl7NG3i37chxpRT6qcBHlh
 +N0TyA2jxLSIT1WOVkz9ZyilXX4I/dpxhotFrPoo8EO5fTI/u76Zr4bQchkIjVH+aNXetel
 UyOd1ew3hwbpahdLWPq3g==
UI-OutboundReport: notjunk:1;M01:P0:9RSsihfLvYI=;zsU/fCmTPLT3d2kyz4kRPhkrIxx DSAVHi9YwMqKRsMvZAq0Pwq3ctYs3zYmnIXEXOlFwFHfq3Xlu11KPXtt+YFLpZ02EWT8BKEGO zho9mEH5PYTjxOsRvLFh8XFoTk0esNY0MG+BPAARxh92C+rMqVIeBe0oW+HbtEqnPDlSHCylg F/2qpPYdDsg/hsbuCKobOEMg4SkIE+4mCJRRi8nfYo4mI0+DqlhwVsE6UWY+oTrxhl4+B0PwS Z6s2NdYZmXDevIDUHRXrt8KczYyiUl8fFRcTJZX+qC030QJWPCcovX/H4ywEzD+KkFHqPQQtK MfLunpmfBk/VReUp8mhcWYOEIYln3+knqdUHMyKKlfCXAgDRbQsi8pHfZ9gDwp5qcDZuCWnoG FocPPEuQiyVnQR9nq6yisc7o8w0+UyXAKejlPn0rZ60nAD8VRjUq3m4iTXRvsf7s7Xm50MZHF BWZMVL7iXS7J3+de2tz/UCHk1gyWntM89SuCyDL48G7qZqREIPuk398IPta8qU8cJvDyZgZhO eJeZLO1WGjlgE8p5t1w0dB3l+eD7d8iy6TCBMOjHW+4VbfM5Tv5Le8T4SxVxIWhWjTM9xdo3r 0DXI4F7HCXkwgeTIAqk7WL1/FQ9y9U3vq2peLxYwMUNuszCwCfMczZYnSJo+h93I3svIBrpzK +impDJVqLELEMUahd0nbACTM3gGdAFJFc5PVQsdZi+58QAMrMRbq+6Ooot6XNut/szCdID3OV jdelnnNb70Pg16YLbsbg8uaJ0sao2ih2W0r9uoBQVtNIXC952RdTMhld2WJR/a7Ky5pDSvtH8 lZw3teSgJo9o8LswFoUdmFIVmQwVkj2oC6530EFBsbzCGhUJUTCVYnJbI4UqGWgQF8XMM9QCe UzhL8TngPBGJRYW2UUnq746T1MCxgj/dTZ9HLXrvhsVL7pv/b7xD7KJ3MS8b4HhOxWC8XbJsM UPPBWzyZQJPbix8gEmaZLYZZHpyT5y4ygTvyluY2zlSXUt/FSN/9bIDGBBCYQM6k2Cn8F3aaX pzsO/nH54+xF65TE/mAqSrpcuB4kfqCvFQct/lgqQr84S+rrqMxXDlN2Yw9bQDdWbjNzWsSmN /MkN/fpJ82KN41yBtVE4lBc5zHkZZfNsb0wUzLnxQGTGi/5fXYol5rfZAjSTl1FTiwSsSbIhS Yi64oFPRaRtvA4BV646DcT8RHqrPKHmX8cSOlueXygeyCCz5zrr5a2R0x1VBDRq5sCoJAz3eZ Gn5E9jpm34ncJsTpnYOio6m1pIVdJWwP+p9TTIJiBR+6RvFHj22lXoI48M+5jfMIeletWe4IB 5ULVDzZ3fj/CFB5+TkSlIgYexaD7avR2ZXmY27AyIf0KWceBO6Yb5iPyl5jPksYMlBUpidd+H EIhS3nJUo9zPIqJL+AwZtIoN/xBiNolIkqzM1kNq6MrB1imBo9E/4Hh7Wrt609E4fvRW9XAxd 5wLCMInHrQIQ105FYZHnUErXQcdUbrzNv1+iwUN6L3bdQDkZLmGCu3QUmGHamXvTf05edAUhK 9HsCBT5EGak0adGTC+qOujAKK4oQfmOcYKw3MwFWxZekzNa4IE33u7mhf5WYHGfM4+dUdVcQM EcbiQ1FsOwYHaKNcOKGVPoo3h5+3qpPqh4iTupGpBgrXM7oseSh9QxGoGPobmMIItWlrcxY8H oQ67LLguiNmReiqcXRFcyaiw3TlAMfSYuGVOSxWqI7qF4tk4iDcw+5YHgRRE/yuJdIilzjZm7 tRcx6B6aydR/KpBz2M7a7Cn5cjM8eY0k1MaUxMQR9Iggt2vwOltyjv/s0Et2HoTmNoZFnDyHg eUiJwSUa5tdZ8zKgF0CjlcFpYtkHhMiyKwAUCiAuZ4Nb3Z4m4iwwvH97Ng3wLrkpt0HZVgaWS bnmuelM1kXVHPBNEnGeVcbbsdNJvEzx+9RWtq4MYgz2elPcpZFlhDuw8S126D2yJcV2axwfUE 0GIV/r1GQtJCh1KJokZ1/HMYFXuGYgkpXxHgugeHNqRTvxeC6QqAZ8UkZVP0/vz6BitEGhMPz FiVjDHsSWme+2zXQo2RK6xzB7gFGEXqqq2wN5BJ60DgiNIteNagUbBOqwLR6H0QGfN2nNtRC/ NXYFiE+lZlthWj+uWS4UjbJHavaVXh37NumRPniwZbJn4oaO31Hu+bntoU0LggR/LSh6ihV0g solg67+4JRmTg58KnSq++HsxTGe22M25KBDrW8pUwtqAOOQRbY7D+UIx+lKW+uUk07jpLRiYH flvVeEEdgkxGSbRVPSPQM0MonkNj4CEY4XqYX+9qys1hHcWH2EvUOYDbCeRYewkhZ95VpyVb8 dayOkUsrPe6JGvEoZuFoPkGXSUJDQJ8sNG8+zBJ4NgNYNR+IiQ5dy4OYTGzHEEJHNRJ1RpssO 7M3xqNHet5qYmKqkiULrptLBRwThIq7kvCP0ldCVBnmGToAMTs+H6K1DwirST2vtZ0m3GGmpO 3yqLN+Mg6UNwnXVF75lY269/XvZQ+m/pvjgWFyXVNjDUd45Pcid8B5QjYVN6p0SxcsJtzZoIg DxAfqsXVrUpAX9bSt3eqBH/4XbxDkQxOc9cvQ1F32KmkkQLfZQun2255W/3fNrSDb7pdFDaCh 1CKDIsdD8BCXzqr/vzY3F7k4VLiT2JhyH47Ls6N3CatfL1ZDxDu2HBhSmCA5MtufSqsG4vpqv T8z840j3ND3WyguCjUrOZVbo96JelLyFoiSqQ38CObjdOIWYK3b3QKX72e9dJXkDPWI/4bois AjYIWAaWer69ih6XXOpq1dprTfCUlWZMnz3geOSRQzmArLbBuYWunNiAJjkwjptHHNPMb6ZDU 8LbovVyq5WukGcxabBubKB/OKAJ9A8qLLjyBUKCNgfL2nLGMxYWCVLtlDp6VicAqrxnrLkiBb KVSkcVUkvfsWg2FWS4WnRRBrYgk2q+OXPy3vTcnYEjbUFXYPjjkFQvjORHYO5uM5qzRfXxxX6 bZX1onVxYXfmA83S5nn46dDwuRjwRUmAxyMQ4pPjIhDhpw7X3dxTPdp+IW5BiL2SMoFvGkoJQ ctofSVArhKFEyJb2VxJXMG+SZjnG5rdG9N3qx7ZoRyzkUL4xEgNpOC6eSAi5adjhZ2ukWyKJT ifByoJelKPRXLaHq6oeHGx9jo4aa5veYmzws7ps/tk0KvrS54rBgyDJzl3sdrkGR+jNbLYxYJ VR8sa2MK4B0K2ps76ri8eE0p+f8Hr8RZ6RHkWRiBuqYEqFAOdc1zZb7OKz9OiaQYTU9mDUT/K xPTPHqutWyU33V65UOYB5oqwT7Knoo7hYFUFqm1JsqaShYpvVs0iyIMJpiE9O8yfZ2nHaN+X1 QLti3cBDV3RPNlgm793LH59O+JK9N7ZxgvVdmxruvnRWk3rASBFNAWqbql1sbvY20i4dLCSDh 3dFqnDMcRKcT3zuH9J7m95z3r5WEoYOaJZU+Lg6FG7+IewdvJ0kLGaMwx3jjbcAQ4gziosR8G VdRTt74MiQKxzYxRgnmEqxwd+azl5JTY2wp1wHDLLT0ZRAoztiEYNAsua2OIken9HKo4LFJ4k B6S0b/CalcGvPmrifvQCGxDwGJaaQtmC7C00EndfwSWmeFAjdBhVnx+MNDkoXHzk6XsyWs7gO 5LmONIItIWiCh2LICbl0PW+7fNXp5Y06ZoyjSFKb0H8N9UYagWHVX6zIPu/s8sI71OCeZUkFN 7adkDLCrk34l4YBXwv0pR5sdLVr532UfYOzGhgxEkLJUamFnYffSMdFEDMP9hsA/BNqKHAHNd v5lH3ZYDnQZwymEErKY8jtAeK8D/yRAA9sZVNCyq0bT/ukBeyNz63Zl74GEdIpz7a0NK8N1Dx EZt7K57cJnkt55tNfL/crSqpCnPS4UYVg2hDIzPTm2FEKNKVQ97ePzE+Vs4IUIz0GjA372WqS
 J9vitp3xR/sSgp3vUlfmONXfpRQCT5589ex7ZimMDzrO6QDbJKxCg3dMAZU7E99y/QPIO6CbD dDkfH5UDr7j/8XpVK1yoDgpWpWomIeMQXjwOzUpWT4AhFGgFlQYau/ZECDQDJYruaysrIvc5p SuaExlceZFzCh/k18IWzWn1hyZCw7Qmg0is2qLBtR+ke5EQmhoV9LesasIP/dqZ+Co+8WIvRt sDr/50p5WB5uLjfmwUqDxXDiRXXcjrHxYhdyewLAEjVRdHBx7mZ1L8wV9DN2mamVtbdNsDmBr 8Op17JqOj4JVQtra3nDrZZCY/YBbEDDbn3mYqviSrbpYhNybFv3rzqVFJjzmwdqZRfgP3WkJt zTfRw9boE7ZydCuEyvE+dvPKfpixUgXBZg8/nr7NUg6huMCrVTNVsCnAyvnEFlrbwlPHWiNvU t1Ih2mlMfy6T9wJzVbAA7woOihRWACOmF2a2PyG9vn4xeOFSbm1VbPOT/Z+oytY3b3fONVQOy /IR6OEFAY03jQyjkeJ3yBsd9rY2I37PnLS9NipW3dtYNGOflMwbJYE/d5UnfV77uRLkz/Inxz KsWn8dNqiqPmKlBGSaoqMYkR1jFj1DPxNtPmWFMGyPlUFmq+xeWpMVj+bme7K55AmJ2YUgqnt PChl7I3jDEeYIOtjNlyTfS+QAW5J22Knn/ec4gIH9q0tDMviMQjAUmSLKrQuURyD/LUrE70w6 I/K5KhrzLC6NeQsBLeaZCbDxLvUgmrmgrtVH9Po5pAKRGSzGiVA/IX8ShOAMYrX8h0xw55PeM BKL17x9d/akhC9HXi9KX7N5L6n+Gh77MqEjWtMDMZAs8rPZZc1Qc9xOgttLC+Echch4Bs6cBd VqT41NSoQLFKkNPRMLqElJDgkG3/v7HmF2GIAkX1WUx+d8KeWtHiBIzAkvGLRpix7pK4DxHjh 6WfVJ/dDtWZckDsfJmI25RBh430hIl70e1xcBE4Bxt8FPkLwE3AcFamBEKVbZcoJM99ERsRZd utuEJkpobJ/AxYJYhhFSEyRHzPltusx/NWa9r4bG9gXq6DnsHVBx5Al5OVO55jiSTfKjBdbOk Wb1QPbvwuhH21QqEXUBY/XblGLmkacT2Wy3TQzGyHYX5OEecFFeQLw+Dsiu+MsxQOoAALGti1 eeqA6kdEz/AQseDWGDGRjXU8Qp+jr88uMl48X2zkDdwglffrqsUG0oyI4q1GLw+voVbc/o6aK I9mdo3AgISORWtzbgzEd25oi3O76UMg9SXg2asAMdt4cBOWQ1eRUyOBSWtEBuiVBa88wfc62K 6mi0OYGOVSS4MNvH10QOhVA3DmJ3/1QRj63Nxq7U4C8EumnQAtKSeS85byQtQTkN0rZOG3StC UYiWbGDKX1BgFxJhqmE+yC2A134gm3RQZlHnZ78y9eSeTn79SYFkb0P/ZCkLEqgDg8fKQJkZi heTS+JVkupFKtyA3F+cI/r0oNWsWLftDw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_072212_177719_5A1C02A7 
X-CRM114-Status: GOOD (  15.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 3/26/26 23:27, Andrew Jones wrote:
> On Thu, Mar 26, 2026 at 12:17:13PM +0100, Manfred SCHLAEGL wrote:
>> In commit 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
>> the initialization of scounteren was moved from the hypervisor (KVM) to
>> the supervisor -- a well-argued change. However, the same change also
>> restricted access to performance counters without comment: previously,
>> scounteren was set to 0x7 (0b111), allowing U-mode (userspace) access
>> to instret (IR), cycle (CY), and time (TM). After the change,
>> scounteren is set to 0x2 (0b010), which allows access only to time (TM)
>> and prohibits access to instret (IR) and cycle (CY). This breaks user-
>> space programs that directly use these performance counters.
>>
>> This change restores the prior behavior: scounteren is set to 0x7,
>> which re-enables U-mode (userspace) access to instret (IR), cycle (CY),
>> and time (TM).
>>
>> Fixes: 5bc409786752 ("RISC-V: KVM: Remove scounteren initialization")
>> Signed-off-by: Manfred SCHLAEGL <manfred.schlaegl@gmx.at>
>> ---
>>  arch/riscv/kernel/head.S | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index 9c99c5ad6fe8..5ad5e12a8299 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -133,8 +133,8 @@ secondary_start_sbi:
>>  	csrw CSR_IP, zero
>>  
>>  #ifndef CONFIG_RISCV_M_MODE
>> -	/* Enable time CSR */
>> -	li t0, 0x2
>> +	/* Enable CY, TM, and IR counters in U mode */
>> +	li t0, 0x7
>>  	csrw CSR_SCOUNTEREN, t0
>>  #endif
>>  
>> @@ -247,8 +247,8 @@ SYM_CODE_START(_start_kernel)
>>  	 */
>>  	csrr a0, CSR_MHARTID
>>  #else
>> -	/* Enable time CSR */
>> -	li t0, 0x2
>> +	/* Enable CY, TM, and IR counters in U mode */
>> +	li t0, 0x7
>>  	csrw CSR_SCOUNTEREN, t0
>>  #endif /* CONFIG_RISCV_M_MODE */
>>  
>> -- 
>> 2.47.3
>>
> 
> 5bc409786752 should have explained that change by referencing the
> same links as commit cc4c07c89aad ("drivers: perf: Implement perf
> event mmap support in the SBI backend") does.

Ahhh, I see :-)
Thanks for the clarification!

> 
> Thanks,
> drew

Best regards,
Manfred


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
